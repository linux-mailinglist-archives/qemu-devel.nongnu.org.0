Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AB33143C7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:29:45 +0100 (CET)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FyS-00077f-Af
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l9CV9-0004Zi-9o
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:47:15 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:36898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l9CUz-0006lX-Jr
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:47:15 -0500
Received: by mail-ot1-x336.google.com with SMTP id k25so13214791otb.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 11:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hg8U34X9seMiuAzzQHxtNGBtQ/sV5kTB88g3i+W/aec=;
 b=z4HT6D+WubOk45oF5EH4QwWhX4cOFvIDgbvY3sIRENFMLHpGRv2MJjcHGkHbT3XHZW
 q+pc2VVw27bSZUDsLFO1mkCMKzARUdDrE5AuPRqhJYYZ/TpFMHEqMlVjYQj+ZeaXqHoq
 G9DjyLeerfo3DsXXGNQcG6f2ZLzVdsXeSQrDiJKKuWAjYwvfQnLMRP7u7CbTKMJoXrXI
 VKvRyqu/FQZE+D6yuWdMFV837unX+KR/aWEzwV6A83dclEkFtYkyzSnzYmLsF6BF8yKd
 1qihmWZHMAt5WqQWeVFu3jBojEV3snl2AwK7OvZwb3K5d4ixJzEFQCGS26TjJpAxW3br
 bnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hg8U34X9seMiuAzzQHxtNGBtQ/sV5kTB88g3i+W/aec=;
 b=MLBXKi+m1xQgppzookteLpXPaV3qwunO7JUFHINE8i23TnSK8m64Uguoissp1QVnc7
 AvDgo1dH0cm1y4S46MMvzUNrinFZ4/lPyPTPllbCRoIWehx6Sn46XuyXnFpUaROylMaK
 fCVNwOJ3J9xtSowyEtu9IXUn/cmTaV9SdNoQjaWNYtsQogVZH9wnu931MfOe9mfXQDeB
 tNpZApDm2dka8W8n0VoF9vm7cbsrPzWkkxdESEcivpUGfqtUdU0NEGYq+2CesXv0tvfM
 QsPBvX4evtGYDPrZLIHfnLa8cSUNJmfHRValSCk3J2fkpprhD440GTRv4h0ZHArXPDP/
 brKg==
X-Gm-Message-State: AOAM533K4OgvM+VS9T6yq++8hlnq+PkNceauyqfwg4InAE11tSHxVAzl
 0ud3lsQ8/UztyJTo8YRQDZuxZhRAxp9OEnKhwBg5sw==
X-Google-Smtp-Source: ABdhPJzLg3u8HZb7pYGWuinQ5rMajQaS6UH3HGTeBgwPFsy4lDRXQws4SqnCP2OIn4nr39WlZ6cd9IhX+N0WseMyCu0=
X-Received: by 2002:a9d:6290:: with SMTP id x16mr14054512otk.109.1612813623098; 
 Mon, 08 Feb 2021 11:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210204202915.15925-4-yuri.benditovich@daynix.com>
 <20210205083742-mutt-send-email-mst@kernel.org>
 <afc2b49b-4751-9a16-0859-8543b7ee8796@redhat.com>
In-Reply-To: <afc2b49b-4751-9a16-0859-8543b7ee8796@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 8 Feb 2021 21:46:51 +0200
Message-ID: <CAOEp5OchL-Yx4GQKr6jZR68-Cq8h=zFZc_LYvT8U7G5wYN_f1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] virtio-net: graceful fallback to vhost=off for tap
 netdev
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::336;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 8, 2021 at 5:15 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/2/5 =E4=B8=8B=E5=8D=889:38, Michael S. Tsirkin wrote:
> > On Thu, Feb 04, 2021 at 10:29:15PM +0200, Yuri Benditovich wrote:
> >> Currently virtio-net silently clears features if they are
> >> not supported by respective vhost. This may create migration
> >> problems in future if vhost features on the source and destination
> >> are different. Implement graceful fallback to no-vhost mode
> >> when some acked features contradict with vhost. The decision is
> >> taken on set_features call and the vhost will be disabled
> >> till next reset (or migration).
> >> Such fallback is currently enabled only for TAP netdev.
> >>
> >> Signed-off-by: Yuri Benditovich<yuri.benditovich@daynix.com>
> > Sounds good, but I don't think we should do this if
> > vhostforce=3Don is set.
>
>
> If we do this, does it mean we won't maintain migration compatibility
> when vhostforce is on?

AFAIU, the 'vhostforce=3Don' should mean the vhost can't be disabled (if
I'm not mistaken this is typically used for vhost-user).
So we can view this case as similar to vhost-vdpa and vhost-user.

>
> Thanks
>
>
> >
> > Also, let's document this behaviour with the vhost option so people
> > are not suprized.
> >
>

