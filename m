Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365D5251B5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:58:21 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBCl-0002uu-U1
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npB2v-0004Gz-Mw
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:48:09 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npB2t-00060o-RQ
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:48:09 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id m128so10541570ybm.5
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E7ojlrNfSmc5Q2kUiuwjbskdmVgAHcKRT6Ntt6ygbvg=;
 b=YAEoby3dFEL0nJuTsLGzXFszFJExya9p9MEd+jPQmR7JBshyJezp9Z4PQFY9s7PnoZ
 7glpRFXrUFUQrdkW4cH6CXDY61PvO6VwFocS+EPjUOTbOVBozcbGCXyhIXlGpxFoQEGW
 JF1BFz3DyAVKmYLMiYNPaTx+svbj5YlW/6J+BR2MHXISfnpI9lFF3mp7b40/s4U5yFLy
 rF8xroIlDiGtSIpAHZwEdiQPU8Exx0Sk7C2HGCkG7n10huD0NZZJ6/T+OY7774bveSvS
 qjVOPbh6Yo5GgPtMLL089avLaOaaNRLZxD1IApB7hQQTy7RQ97V1VaQIh2faDgIYN6xJ
 9lSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E7ojlrNfSmc5Q2kUiuwjbskdmVgAHcKRT6Ntt6ygbvg=;
 b=hFuVr8anVSXYIQK+32qDrobJW286i4hrbFQiiWgjfcV7ahF3WlpW8u0FnpXx6oTHkH
 y0dEBabvmAQHG625IScVZIoLrgnUB8zQ0QivkmynGRzUKgYE+Su/jz2fSssZa6LqJNxt
 LRBloQVAsx519NjwFBRWLyI/FH7ge3wuYYdhWbWFnAuexckcLtkdHPKvqFcxsJ8PtwNN
 LrXgub8gSyuXKmMxzDYFmC2U8NQMDje7Mp8vcMAOXmBoHzWuImgy+myTanTx9f8wXXND
 2YtPE4YZ8dozeno/nzZb/gwm777EWFsAzzInzYNzb5OKk/g/Ecb6eaqViHCmC1SHX//m
 9EDw==
X-Gm-Message-State: AOAM533UF6wmvZ+4C9QChyFnVn1FgHgTKonKi+p9LmSNSc7CB4CI+nK3
 Zkx8yELW/leIYlgHpiFMKoubnWt2Z1TpagPWx1CKtA==
X-Google-Smtp-Source: ABdhPJzT+UthMdvrwIsIsFdRFDePn3VMKIboj7vNGpwewiL/kpHrGAJ6OtbwGlqHyHJGMemmXgY2fGd1l39zH1O5/KU=
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr453116ybu.39.1652370486522; Thu, 12 May
 2022 08:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220315061420.31910-1-jasowang@redhat.com>
 <20220315061420.31910-9-jasowang@redhat.com>
In-Reply-To: <20220315061420.31910-9-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 16:47:55 +0100
Message-ID: <CAFEAcA_p4KWptkQ4xUXmtUkmYufn72KLr=1B_9q1QZ3FLJBkPw@mail.gmail.com>
Subject: Re: [PULL V3 08/15] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Tue, 15 Mar 2022 at 06:14, Jason Wang <jasowang@redhat.com> wrote:
>
> From: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Initial version of shadow virtqueue that actually forward buffers. There
> is no iommu support at the moment, and that will be addressed in future
> patches of this series. Since all vhost-vdpa devices use forced IOMMU,
> this means that SVQ is not usable at this point of the series on any
> device.
>
> For simplicity it only supports modern devices, that expects vring
> in little endian, with split ring and no event idx or indirect
> descriptors. Support for them will not be added in this series.
>
> It reuses the VirtQueue code for the device part. The driver part is
> based on Linux's virtio_ring driver, but with stripped functionality
> and optimizations so it's easier to review.
>
> However, forwarding buffers have some particular pieces: One of the most
> unexpected ones is that a guest's buffer can expand through more than
> one descriptor in SVQ. While this is handled gracefully by qemu's
> emulated virtio devices, it may cause unexpected SVQ queue full. This
> patch also solves it by checking for this condition at both guest's
> kicks and device's calls. The code may be more elegant in the future if
> SVQ code runs in its own iocontext.

Hi; Coverity thinks there's a memory leak in an error handling
path in this code (CID 1487559):

> +/**
> + * Forward available buffers.
> + *
> + * @svq: Shadow VirtQueue
> + *
> + * Note that this function does not guarantee that all guest's available
> + * buffers are available to the device in SVQ avail ring. The guest may =
have
> + * exposed a GPA / GIOVA contiguous buffer, but it may not be contiguous=
 in
> + * qemu vaddr.
> + *
> + * If that happens, guest's kick notifications will be disabled until th=
e
> + * device uses some buffers.
> + */
> +static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
> +{
> +    /* Clear event notifier */
> +    event_notifier_test_and_clear(&svq->svq_kick);
> +
> +    /* Forward to the device as many available buffers as possible */
> +    do {
> +        virtio_queue_set_notification(svq->vq, false);
> +
> +        while (true) {
> +            VirtQueueElement *elem;
> +            bool ok;
> +
> +            if (svq->next_guest_avail_elem) {
> +                elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> +            } else {
> +                elem =3D virtqueue_pop(svq->vq, sizeof(*elem));
> +            }

Here virtqueue_pop() returns allocated memory...

> +
> +            if (!elem) {
> +                break;
> +            }
> +
> +            if (elem->out_num + elem->in_num > vhost_svq_available_slots=
(svq)) {
> +                /*
> +                 * This condition is possible since a contiguous buffer =
in GPA
> +                 * does not imply a contiguous buffer in qemu's VA
> +                 * scatter-gather segments. If that happens, the buffer =
exposed
> +                 * to the device needs to be a chain of descriptors at t=
his
> +                 * moment.
> +                 *
> +                 * SVQ cannot hold more available buffers if we are here=
:
> +                 * queue the current guest descriptor and ignore further=
 kicks
> +                 * until some elements are used.
> +                 */
> +                svq->next_guest_avail_elem =3D elem;
> +                return;
> +            }
> +
> +            ok =3D vhost_svq_add(svq, elem);
> +            if (unlikely(!ok)) {
> +                /* VQ is broken, just return and ignore any other kicks =
*/
> +                return;

...but in this error return path we have neither put elem
anywhere, nor freed it, so the memory is leaked.

> +            }
> +            vhost_svq_kick(svq);
> +        }
> +
> +        virtio_queue_set_notification(svq->vq, true);
> +    } while (!virtio_queue_empty(svq->vq));
> +}

thanks
-- PMM

