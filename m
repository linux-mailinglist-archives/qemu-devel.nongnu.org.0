Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23A650AAE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:21:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ED2-0006D1-Pi; Mon, 19 Dec 2022 06:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1p7ECy-0006Co-K1
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:21:24 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1p7ECw-0000rj-H7
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:21:23 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3b48b139b46so122041697b3.12
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 03:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cDanUkDpZ60nFAxZspj8jfah6S5OzMFvbMF/UrxvXxo=;
 b=c1BeuJxMyI3mjQNY/+Pc9GMWFaI4N3n8sKmLv1cPCeTDPYDE83Qf2mzlblktul44BH
 aKJwGVdlZx/CEkRPiRYlZwiqFDMdLpSOuCx0LE3Ei7t9GDQOe9Uj9eaSfN0r7WHuJLpf
 KDbXJXGPXeIxzM41l6168JnquXG8xHiglGbqQcTT79rB+pw5YYvEbtyEQErSb8zDu1gz
 MpMQIv1QBZSSECgLw/IKKFDxK22kmjUickJDMarTkGnzKlf0ClAC4IaCW3J26Tju5e5B
 FVleXg5iKj24LRLJz0cOlPMieYUHTftNPCyQ4lp5tq6OvQ1E6Golo5mVlmgyU/zm3bH8
 8/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cDanUkDpZ60nFAxZspj8jfah6S5OzMFvbMF/UrxvXxo=;
 b=DQkFek9lB6kk5GBdEQo+t7xUp39Lt499YzBdiWXz/1yRgk9MhxJEJZyjOuSyf05oW8
 q4EXIqmj6R7r7gx+HgbZvqygGPgM3puDCL2rg3zpkq9dT8x8TMzkmoJ9wk+YwjPv65nf
 jFR8hVCKITd72rxrWA8fjhTG/IasYKZazbiaFN9q4WtqD6F7YtQr3LrO13qFJzhpcaf5
 lGrtRrtW/7e1eYfubA9uu23H22V+D3+l9r078biJ0ePnSegYLpPmYVpgdFGEJn4cIUPq
 TTtsNeSBPx3f3jVs8aj5mqbK4LqScACPdmHiq6qNtd2weMN9G+YQwdo67Urnq21ZQ+Ma
 HlcA==
X-Gm-Message-State: AFqh2krJxYZWVfqxDfmYoUQkfPfk1iIqy4XaWdc7DJlmpZvAeVuoQ1wk
 CGvSvBGiqFiLNXxtOFnXFt1mDEyHveij+z9cQhE=
X-Google-Smtp-Source: AMrXdXse6xdfrch4u/jOPLqGtLt2rugcnYoIK3G60vp0CdKtIqae+f2HSeaY0hL8pwYYE5KEt9a/XGd+qAnt4pG8r6A=
X-Received: by 2002:a0d:ead7:0:b0:3e4:58a5:d3c0 with SMTP id
 t206-20020a0dead7000000b003e458a5d3c0mr647992ywe.432.1671448880805; Mon, 19
 Dec 2022 03:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
 <CAC_L=vXsKpai6Wr0Fi2r5sr4U+tshPB9VizqntDppqE=1_FbVQ@mail.gmail.com>
 <339b8c7d-1f54-a515-8854-c22d10f79d1d@suse.de>
 <CAMPkWoOFXfyx=ZOv8i6AJ8Lv2GFKt11gnXYZ2W_4roS9UP9m5w@mail.gmail.com>
In-Reply-To: <CAMPkWoOFXfyx=ZOv8i6AJ8Lv2GFKt11gnXYZ2W_4roS9UP9m5w@mail.gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 19 Dec 2022 12:21:09 +0100
Message-ID: <CAC_L=vUD2vVNSaP7UcDuRUCyd8XNmb4iRY_LXK0UNEE-+Rr4TQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/pvrdma: Protect against buggy or malicious guest
 driver
To: Yuval Shaia <yuval.shaia.ml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, qemu devel list <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, wxhusst@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 19, 2022 at 10:57 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>
> Can anyone else pick this one?

Adding Thomas,

I dropped the ball with this one, I am sorry about that, maybe it
doesn't worth a Pull Request only for it.

Maybe it can go through the Misc tree?

Thank you,
Marcel


>
> Thanks,
> Yuval
>
> On Wed, 7 Dec 2022 at 17:05, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> On 4/5/22 12:31, Marcel Apfelbaum wrote:
>> > Hi Yuval,
>> > Thank you for the changes.
>> >
>> > On Sun, Apr 3, 2022 at 11:54 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>> >>
>> >> Guest driver might execute HW commands when shared buffers are not yet
>> >> allocated.
>> >> This could happen on purpose (malicious guest) or because of some other
>> >> guest/host address mapping error.
>> >> We need to protect againts such case.
>> >>
>> >> Fixes: CVE-2022-1050
>> >>
>> >> Reported-by: Raven <wxhusst@gmail.com>
>> >> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
>> >> ---
>> >> v1 -> v2:
>> >>         * Commit message changes
>> >> v2 -> v3:
>> >>         * Exclude cosmetic changes
>> >> ---
>> >>  hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
>> >>  1 file changed, 6 insertions(+)
>> >>
>> >> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
>> >> index da7ddfa548..89db963c46 100644
>> >> --- a/hw/rdma/vmw/pvrdma_cmd.c
>> >> +++ b/hw/rdma/vmw/pvrdma_cmd.c
>> >> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
>> >>
>> >>      dsr_info = &dev->dsr_info;
>> >>
>> >> +    if (!dsr_info->dsr) {
>> >> +            /* Buggy or malicious guest driver */
>> >> +            rdma_error_report("Exec command without dsr, req or rsp buffers");
>> >> +            goto out;
>> >> +    }
>> >> +
>> >>      if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
>> >>                        sizeof(struct cmd_handler)) {
>> >>          rdma_error_report("Unsupported command");
>> >> --
>> >> 2.20.1
>> >>
>> >
>> > cc-ing Peter and Philippe for a question:
>> > Do we have a "Security Fixes" or a "Misc" subtree? Otherwise it will
>> > have to wait a week or so.
>> >
>> > Reviewed by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> > Thanks,
>> > Marcel
>> >
>>
>> Hi all,
>>
>> patch is reviewed, anything holding back the inclusion of this security fix?
>>
>> Thanks,
>>
>> Claudio

