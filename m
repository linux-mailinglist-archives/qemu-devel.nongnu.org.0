Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607052B7CD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:43:25 +0200 (CEST)
Received: from localhost ([::1]:53896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrH9I-0007rG-DD
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrH50-00060I-Vl
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:38:59 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrH4u-00025g-Ud
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:38:58 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id f16so2943668ybk.2
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fj7AHfMnPA5Wekb0If3HMC1518Ep2nsfInrsISSdom8=;
 b=pBF+LR/nocxQGalYqR00s1CeduTLOkTx8t4ovBy9dlJlE8JcZKyCu50a7P1nqgt/Z9
 2wboXUG9Fcl36S5m49kS/H/9jH1RcN5iBX8GTvqAEren4U4xkmYA4JTNvYWf6q+AGd1R
 Lfpg1HUgBaKPUt/24uKj8qI4E/NIFN5ZAHdy1IFtJXmIjybwbQPM4cjXGX5UnTkDjhi/
 XIaqH1rBgYbZyaaNLhSC6mzJLi8q6x1N/q28F4tOtJsTi9WTch9jfAr4oNK1Mv0blJCk
 b7SzeNiHnpWfL0WvxgpD02/H9JgsueJ9qRTFfWBNch0mvS2trlKE3t6bULvTlyo/ikjC
 Av+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fj7AHfMnPA5Wekb0If3HMC1518Ep2nsfInrsISSdom8=;
 b=U1VcUIugYKknhZX9aDfsQQoFoKDC7CRBC+5H9p7x5NmNhdfkOYYmaXgMb5BnujxZw+
 GONOXN9ecTsfUZR8ho97dDTezg2Ay4rzPlLJeGAz5MP+lM8pxI8i4R8stRc7ba0vvWSQ
 e+fpxGG010YFXlE/7a6NzxLVISgegxTwo4O8uzvzyc77eSR7GLmUuqOBiQHocdeZ12h7
 oZBEv3Wek5fdSvUIPzx/HbzsmsUuIyqMRcDzBhT+1XcQ5NHIIRcPKKDyzJ7dlCdIYN+2
 hqoW4Soqu5T7JZT8VTBxBX+X6IPe5SjTS0YC745JIr43pobUGd2ytfc6033ngCcqP1uF
 fsyA==
X-Gm-Message-State: AOAM533J4/2zbg07t6RlQvtIINRcVnG3Kv3/PSHN+Qqx8u9rBflOGdyd
 hkOy2gczTxfYCP1Zacs1iR5NOPJN3EKepHsmpAVeLg==
X-Google-Smtp-Source: ABdhPJzI+NuiOlmeaRihq9N/BKqX4E1c2NRzy6sh23J0O1DYwHoDQAmuWV0cG1cT1lALkkrajNLeEuOBHXJxjIxHfmM=
X-Received: by 2002:a25:257:0:b0:64e:b1fd:2d54 with SMTP id
 84-20020a250257000000b0064eb1fd2d54mr240866ybc.193.1652870331453; Wed, 18 May
 2022 03:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <YoStJsVtyKVdLdVL@work-vm>
In-Reply-To: <YoStJsVtyKVdLdVL@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 May 2022 11:38:40 +0100
Message-ID: <CAFEAcA9iWxbpo1VNZy11XXm4VodLeKjNr5ckvD5pa3GY1OsZEw@mail.gmail.com>
Subject: Re: New Defects reported by Coverity Scan for QEMU
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: berrange@redhat.com, leobras@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 May 2022 at 09:26, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> This one is more curious:
> > *** CID 1488869:  Insecure data handling  (TAINTED_SCALAR)
> > /qemu/io/channel-socket.c: 716 in qio_channel_socket_flush()
> > 710         int ret = 1;
> > 711
> > 712         msg.msg_control = control;
> > 713         msg.msg_controllen = sizeof(control);
> > 714         memset(control, 0, sizeof(control));
> > 715
> > >>>     CID 1488869:  Insecure data handling  (TAINTED_SCALAR)
> > >>>     Using tainted variable "sioc->zero_copy_sent" as a loop boundary.
> > 716         while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
> > 717             received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> > 718             if (received < 0) {
> > 719                 switch (errno) {
> > 720                 case EAGAIN:
> > 721                     /* Nothing on errqueue, wait until something is available */
>
> it's not clear to me why it considers that 'insecure'; is that because
> it's using values returned by the recvmsg ???

Yes. The web UI is generally worth looking at for this kind of thing
as it has a lot more detail than the emailed summary. In particular
it shows the sequence of steps including where the tainted data
starts and how it propagates through other variables to get to the
point where it complains about it being used. In this case the
relevant steps are:

 10. tainted_argument: Calling function recvmsg taints argument msg.
 16. var_assign_var: Assigning: serr = (void *)cm->__cmsg_data. Both
are now tainted.
 19. lower_bounds: Casting narrower unsigned serr->ee_data -
serr->ee_info + 1U to wider signed type long effectively tests its
lower bound.
 20. var_assign_var: Compound assignment involving tainted variable
serr->ee_data - serr->ee_info + 1U to variable sioc->zero_copy_sent
taints sioc->zero_copy_sent.

More generally, there are quite a few "insecure data handling"
reports currently uncategorized in Coverity because I don't really
feel competent to judge whether they're legitimate or not a
problem for us. If anybody feels like taking on that task that
would be very helpful.

(Quite a lot of them are in slirp. I guess we could just bulk
close all of those on the grounds that slirp for us is now an
external module, assuming we trust the slirp folks to be on top
of their Coverity reports :-))

-- PMM

