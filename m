Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E84F3325FB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:02:32 +0100 (CET)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJc0N-0004Fp-5V
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJbYF-00057r-4A
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:33:27 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJbYD-00026M-FP
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:33:26 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id l8so13741827ybe.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 04:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OrQiduMHxj8r427PICG1/TaGKi8yJJJ4L4xvewL4Hls=;
 b=kuyyj6ltHkrm+0fSdhVJwa4TVnvognTbc7LWKxZxWsP6jf+sKwhHVXuukRb2IGkB+x
 jI4vH2sOuFBIBUqyn5cNebvCBgpxiTbTg5ZRszbSID5+p5RuCKiQ5H/PyLlaDu4btIAJ
 bVAOwWwkH3R46MEysUYOdBpRQzDlxSECFXpV+AaOHMvkc28KgKORvpPdg/1Pc/kzAZ2Q
 AKVlTQt+bx/HlAfvIJrHteTacBAzKNsxCeNaNwUJ/1fJsAfANs/UDH0EipY6Ka/Fyb8K
 2WliCoW8DhgxeemLtlqFsqg+7jJQJItlsAEIYU/WTITg6lyDzanKnUPde9p6YgtIMjdn
 ZukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OrQiduMHxj8r427PICG1/TaGKi8yJJJ4L4xvewL4Hls=;
 b=P2BA8RgmPZ17wCwoHxlCpRfxPlvBENBnNMiM6e975giMlf92ses1oh/MZoewLtd3Bz
 0egqhAw8fETo97BpMO5gqZuGmQwfJmmWhBboqk6EOjC+2gF/pNmKkDGfcuSm9/V0uSCq
 mBdCWZb5i+KAfKYErnOTQlvbsI6c55nKVGoRROhlq1LTHPJiPfzo9EKuHkxMEky1yzOv
 FTo9rCyNkqGlk1XDvuLQfAdft2ZymcE7gehGO5wMN2+tNE2iNPp7RZLzwpnqUF7xX58b
 Bt4iq9pxR/AiuMIiq2EiVY0UEhBePSbV18g6fB/Aq6kpF9UoSqvdPklfSsqUBIlFEtfP
 f8ug==
X-Gm-Message-State: AOAM530tn9Nem20HL4A/FbSCQWaWeLs9MMMMFNrwU/B3uv517JXs7GOA
 o0kH8bF93kWItT7zdKdmlGv87IkIo98tL3X8sZg=
X-Google-Smtp-Source: ABdhPJw5J/SvpHYXF6kzyKyhutYOh4q+omUDsXLaP15c79/8KjVyykoweHxPfSKIy0JOcQamfxZgntzBrV6FB7kTV1g=
X-Received: by 2002:a25:8712:: with SMTP id a18mr40951005ybl.306.1615293204372; 
 Tue, 09 Mar 2021 04:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
 <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
 <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
 <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
 <a26ef919-2e00-ae5b-c016-83e811ea5cdd@redhat.com>
 <CAEUhbmWdn8ZV1vNku_7dQfNg68xL6p3f-BCzq31jj5QAKmjj0w@mail.gmail.com>
 <CAEUhbmUY89OEpBpxCZzya=KKb1U5KBO=rPArn8yre7fmZe1q5A@mail.gmail.com>
 <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
 <9FFFC757-FD77-4683-8A7F-A39E2337EE2F@redhat.com>
In-Reply-To: <9FFFC757-FD77-4683-8A7F-A39E2337EE2F@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Mar 2021 20:33:14 +0800
Message-ID: <CAEUhbmVG5qUee1XRDia95eOL8B1rLFpKsaQaY-bkejv_0uzajg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Yan Vugenfirer <yvugenfi@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 8:30 PM Yan Vugenfirer <yvugenfi@redhat.com> wrote:
>
>
>
> On 9 Mar 2021, at 12:13 PM, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com> wrote:
>
>
> Hi Jason,
>
> On Tue, Mar 9, 2021 at 5:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
>
> Hi Jason,
>
> On Tue, Mar 9, 2021 at 4:57 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
>
> On 2021/3/9 4:35 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
>
> Hi Jason,
>
> On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/3/8 6:22 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
>
> I think the key thing we need to do here is make a decision
> and be clear about what we're doing. There are three options
> I can see:
>
> (1) we say that the net API demands that backends pad
> packets they emit to the minimum ethernet frame length
> unless they specifically are intending to emit a short frame,
> and we fix any backends that don't comply (or equivalently,
> add support in the core code for a backend to mark itself
> as "I don't pad; please do it for me").
>
> (2) we say that the networking subsystem doesn't support
> short packets, and just have the common code always enforce
> padding short frames to the minimum length somewhere between
> when it receives a packet from a backend and passes it to
> a NIC model.
>
> (3) we say that it's the job of the NIC models to pad
> short frames as they see them coming in.
>
>
> I'm not sure how much value we can gain from (1). So (2) looks better to =
me.
>
> Bin or Philippe, want to send a new version?
>
> I think this series does what (2) asks for. Or am I missing anything?
>
>
>
> It only did the padding for user/TAP.
>
>
>
> (hit send too soon ...)
>
> Ah, so we want this:
>
> if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)
>
> correct?
>
>
> No, option (2) is "always pad short packets regardless of
> sender->info->type". Even if a NIC driver sends out a short
> packet, we want to pad it, because we might be feeding it to
> something that assumes it does not see short packets.
>
>
> Some thought on this option - in such case with virtio-net, can we also g=
et an indication from the device that the packet will be padded?
> Currently we are padding short packets in Windows driver (this is MS cert=
ification requirement), and it will be nice not do to this in the guest if =
device will announce such capability.
>

This is more of a virtio-net specification question. virtio-net should
expose a register bit to control this behavior, just like a real world
NIC does.

Regards,
Bin

