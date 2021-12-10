Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D9A470101
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 13:49:40 +0100 (CET)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvfLH-0004FD-R8
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 07:49:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvfHM-0002pT-J0
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:45:36 -0500
Received: from [2a00:1450:4864:20::42d] (port=45622
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvfHH-0006Zf-EH
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:45:36 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o13so14675308wrs.12
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 04:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rYXWxD+7Z0dBNs4fyb207roxMlJzxPzMSLCS+zCEZ0A=;
 b=yDwv3cfi3HLzHn6qd5isceE5P1cZg2A7r8MErmiFLtEn1G950iKCJeNqzlaP0X60L1
 dD4ETU9J+GEmQ2CWt6JfsXi8WctydlMR/hYN4xyH6klIlxPXi8iZvCGrU4f3BN6mfuk4
 meT+qSi1T0txZ7CDL+j1+qSLRsUSTFY+YCgRsiayB3K58AXJI2dj9gQe+074fWY21SgW
 R0O8mWdUAbBgoGhfPhqzFVJn08HhtaD7TS1wj9Svt9clBgCzzv2Vi1jA6/53pbQl81Jr
 PZCBJojXDLvtz5mugOdZ6r8PcNZLMb4F5xSojsqURJqA6xpOb3ayJRQfCJa0q6HTCgQt
 9XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rYXWxD+7Z0dBNs4fyb207roxMlJzxPzMSLCS+zCEZ0A=;
 b=F4PZyPOAR1Z2wcPXiyGAsp6RF/Ixp5JNFoQv6Ci1+2yP1OtT02WS6B2G2R6Er3j6H2
 40JBnWcbzKLVU9G+31IKCGyQUcodWCjuG19X2nVrU/0qVXi2klBBb5wkhallaKo925TS
 1B2q8tBTdeDoRN1+jBYUUWk2VErqLv6+T/Px13+YJ9WbcuWkuZdoyzDJid9DdLK7KTYO
 kdTLuTIOk6RwNQsStkwYvGK8RDWsSmPT0FtyNcxSxGhIV7iVxEMjZOaXHCGqskT1rLLe
 9oV4uIHxtBbvCcm4CbVuaXEr46mk/dC4NzQYCBju+NHGSbCJZnJ2AuRbbEDDwwIVC+o0
 qjRw==
X-Gm-Message-State: AOAM533Ehh3BN/UzTipUSgDIXu4QuOXSmGroK3mHRP1E31SqRrGybuuJ
 dN0Co1aiQaOKxhTtED+l+67NCw==
X-Google-Smtp-Source: ABdhPJwycocJJ1wJ93zecaOpFPmT3XRRAmam47IWROlE9UZ0SAgH8hvZV/brp+d50sD+NS0hfW7zFA==
X-Received: by 2002:a5d:64ce:: with SMTP id f14mr13171580wri.165.1639140329459; 
 Fri, 10 Dec 2021 04:45:29 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id n7sm2537455wro.68.2021.12.10.04.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 04:45:28 -0800 (PST)
Date: Fri, 10 Dec 2021 12:45:27 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 6/8] virtio_video: Add Fast Walsh-Hadamard Transform format
Message-ID: <20211210124527.GA382594@xps15-9570.lan>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-7-peter.griffin@linaro.org>
 <20211210055809-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210055809-mutt-send-email-mst@kernel.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.griffin@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Fri, 10 Dec 2021, Michael S. Tsirkin wrote:

> On Thu, Dec 09, 2021 at 02:55:59PM +0000, Peter Griffin wrote:
> > Linux vicodec (Virtual Codec) test driver in Linux implements
> > FWHT. FWHT was designed to be fast and simple and to have
> > characteristics of other video codecs and therefore face similar
> > issues [1].
> > 
> > https://en.wikipedia.org/wiki/Fast_Walsh%E2%80%93Hadamard_transform
> > 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  include/standard-headers/linux/virtio_video.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/standard-headers/linux/virtio_video.h b/include/standard-headers/linux/virtio_video.h
> > index 16b5f642a9..3b517d50c4 100644
> > --- a/include/standard-headers/linux/virtio_video.h
> > +++ b/include/standard-headers/linux/virtio_video.h
> > @@ -75,6 +75,7 @@ enum virtio_video_format {
> >  	VIRTIO_VIDEO_FORMAT_HEVC, /* HEVC aka H.265*/
> >  	VIRTIO_VIDEO_FORMAT_VP8, /* VP8 */
> >  	VIRTIO_VIDEO_FORMAT_VP9, /* VP9 */
> > +	VIRTIO_VIDEO_FORMAT_FWHT, /* FWHT used by vicodec */
> >  	VIRTIO_VIDEO_FORMAT_CODED_MAX = VIRTIO_VIDEO_FORMAT_VP9,
> 
> Is last line still correct? Seems fragile ...

Ah good spot! This is a typo, I should have updated it to
VIRTIO_VIDEO_FORMAT_CODED_MAX = VIRTIO_VIDEO_FORMAT_FWHT,

Will fix in the next iteration.

Peter.


