Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0ED4C1E7F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:31:29 +0100 (CET)
Received: from localhost ([::1]:56316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0AS-0005C9-4G
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN08u-0004Sk-AR; Wed, 23 Feb 2022 17:29:52 -0500
Received: from [2607:f8b0:4864:20::236] (port=36405
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN08r-0000fG-MX; Wed, 23 Feb 2022 17:29:51 -0500
Received: by mail-oi1-x236.google.com with SMTP id p15so591371oip.3;
 Wed, 23 Feb 2022 14:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3TvadqmyKbj6nZtFWECmj/hcnJsiLYYIzvkR+/YviTY=;
 b=prF8flWn5vlgG8hmXJsLkNw6BoM+++V60lxAYb/biDO6AGD7DX+Is+RbSuM71Pl/dg
 YjXsfZansqBXCVJTZuIgB/g2MbiOepsSO/ivJF/zyQCVYgdFiG5oDRsuI0PBkRvOT6YG
 +n33N9niuWTxfgSm5symgAfu7xLbMtEQep4KVMrQfHrfT7jDfgzGSvm0StoLVa5au+Ce
 iYLnVqiIXDBGeEThRo0k/E402gY+yGaGFDvM1znLZV/5EO2ebacG5+CtSTCJ/HyyZCxn
 a0WjpokgKanjaiTuUQYNCzCKFTnbtZcE6WqBEr04A/7FyqJXY4RqmMz5hvyHWZotE1ND
 XkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3TvadqmyKbj6nZtFWECmj/hcnJsiLYYIzvkR+/YviTY=;
 b=PLzL+RgpZcgxiSk7PJgrzBRfcjbDkNMcHVfhcelfnRgNocb3Gm0ZFwc1YQuBuxVkSX
 y4MW0/KQuVCrcLiBTxpr8lw/DKBrFstaYTmMPcO374QzVaJZAJV568eysdWueji24bFP
 8n6IMGJL2TgFL2QfwNDzSdAQmq+iCD7BhNgD3vS7Gr5wzZOALz+gQ+8sJLUD/jWvJUXx
 WzxiFAzkJw4VXQ8ibmY3+Qqnz3wkBBD4d0OUO7Dfjsud/KDXrY8K3sCeCoM7EhdV/JTN
 K9IK1FuZXqj2JmmhF/8BuM5vYL2qc00g1u4kiPVQEH5eKHwfA9fzHfRUP/g/ljtxY6xI
 Q6dw==
X-Gm-Message-State: AOAM532ie0a2k1uEn5lwUE9s19/bEG1ztCYWwzrTIpg/FLUFsna1Rqez
 mRVzfciruWhlP/YH8oMKMolWoRtyb/IASLHPl6E=
X-Google-Smtp-Source: ABdhPJxLmg+a0g8beBlU5Go1lpl0ifHoRys4hcPKPm0/6v/oqr1fCbGwlDCF/gbd4NjXxtvvCP9aU5412w0MbZvPr7U=
X-Received: by 2002:a05:6808:2006:b0:2d5:11f8:d69d with SMTP id
 q6-20020a056808200600b002d511f8d69dmr6047153oiw.218.1645655388185; Wed, 23
 Feb 2022 14:29:48 -0800 (PST)
MIME-Version: 1.0
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-2-dmiller423@gmail.com>
 <3db47aeb-a57e-55e3-92f2-620845fe00df@linux.ibm.com>
In-Reply-To: <3db47aeb-a57e-55e3-92f2-620845fe00df@linux.ibm.com>
From: David Miller <dmiller423@gmail.com>
Date: Wed, 23 Feb 2022 17:29:35 -0500
Message-ID: <CAEgyohWaRVAfaFcoEBzgps-=u1UiTWLeHs6M7gLp_ONjLDpNmQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes I'm adding to this patch,  I haven't quite figured out where to
put them,  they are inline to various things in the patch themselves
so I'm putting in the cover letter under the patch they go to.
I hope that's correct.

Thanks
- David Miller

On Wed, Feb 23, 2022 at 8:40 AM Christian Borntraeger
<borntraeger@linux.ibm.com> wrote:
>
>
> Am 18.02.22 um 00:17 schrieb David Miller:
> > resolves: https://gitlab.com/qemu-project/qemu/-/issues/737
> > implements:
> > AND WITH COMPLEMENT   (NCRK, NCGRK)
> > NAND                  (NNRK, NNGRK)
> > NOT EXCLUSIVE OR      (NXRK, NXGRK)
> > NOR                   (NORK, NOGRK)
> > OR WITH COMPLEMENT    (OCRK, OCGRK)
> > SELECT                (SELR, SELGR)
> > SELECT HIGH           (SELFHR)
> > MOVE RIGHT TO LEFT    (MVCRL)
> > POPULATION COUNT      (POPCNT)
> >
> > Signed-off-by: David Miller <dmiller423@gmail.com>
>
> For your next patches, feel free to add previous Reviewed-by: tags so that others
> can see what review has already happened.

