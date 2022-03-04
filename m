Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8908E4CD2A5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:42:32 +0100 (CET)
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5OJ-0007d4-Je
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:42:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ5HF-0005QB-Ge
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:35:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ5HD-00027P-R1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646390110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aTP72OuXUGyN5QMTKund2mceL2rox5drVmYYqAWWAWE=;
 b=JqxCLh+zSWqJK5SZR0vvFDTnMid4pRqfSB/PyWGG7rO0MfCnSTkRMQaWAZ1GglVrLlaXDD
 Z66fJxNBKiij/HyhL5hfxmA4yx3ACMotttCbVvgpbmHaEeEF6H9GD5K5DFcungd9kN1123
 w3w7aQpdhHlkrNFNcxf5mEjV27Q4A7U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-nCJfnwXYNlOyk3QFwu3xPQ-1; Fri, 04 Mar 2022 05:35:09 -0500
X-MC-Unique: nCJfnwXYNlOyk3QFwu3xPQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ay18-20020a5d6f12000000b001efe36eb038so3226173wrb.17
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aTP72OuXUGyN5QMTKund2mceL2rox5drVmYYqAWWAWE=;
 b=iKvAYieHYOeceR2B1/sUkPvw9IDh619xuglfz8uMEFJxPn91QczyCHTXKsB0abiFgV
 ShjzfwBp4NjAvag/5YDePy/q18HModiwwzFMOOo6iJN/RWkfOC9lQfD9N6134qso+2PW
 r/jMN9GfY1+1hwmK0++MXolvVXpRi3xnf3Kg3B80R7hQJz8V8eQlmCYmmTQPNr1vReF8
 MKcldkeGZ5or2PsHhDyvpDcapfjSCexTIzC/6Ktqq8f+DsfPxIbfhnlUW3lD+ckW8WRU
 sc95hpw2s/pEX/z5FR2hobswBR8nvdwTuJc+zU+r5eXXihj3lPvVlYuaKdpU8Lc5gaFH
 i0sA==
X-Gm-Message-State: AOAM531+9MZlKC/9g+7pjTg0lmgYBWvpcki2hnfYg2Qg/epYZ2dgmgx5
 /xE9g4oCAg9yDtCKDes1BQleXxTPBtURikBX4A0pBRvT5c5r3RQNqyaRI19YXBDhd95tyBJbAGg
 nFwR+puzv/SbfK+Q=
X-Received: by 2002:adf:d1c9:0:b0:1ea:830d:f1b0 with SMTP id
 b9-20020adfd1c9000000b001ea830df1b0mr30082469wrd.522.1646390108384; 
 Fri, 04 Mar 2022 02:35:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBoEWnkTyY47uRej3nBN62Zla7j1qhOJQg1IbWcq42GoEOzdoGVLqDv4sEqS2Q9IErD+aglg==
X-Received: by 2002:adf:d1c9:0:b0:1ea:830d:f1b0 with SMTP id
 b9-20020adfd1c9000000b001ea830df1b0mr30082440wrd.522.1646390108163; 
 Fri, 04 Mar 2022 02:35:08 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm13576042wmq.17.2022.03.04.02.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:35:07 -0800 (PST)
Date: Fri, 4 Mar 2022 05:35:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v3 4/4] docs: vhost-user: add subsection for non-Linux
 platforms
Message-ID: <20220304053326-mutt-send-email-mst@kernel.org>
References: <20220303115911.20962-1-slp@redhat.com>
 <20220303115911.20962-5-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303115911.20962-5-slp@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 John G Johnson <john.g.johnson@oracle.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 kvm@vger.kernel.org, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 12:59:11PM +0100, Sergio Lopez wrote:
> Add a section explaining how vhost-user is supported on platforms
> other than Linux.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  docs/interop/vhost-user.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index edc3ad84a3..590a626b92 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -38,6 +38,24 @@ conventions <backend_conventions>`.
>  *Master* and *slave* can be either a client (i.e. connecting) or
>  server (listening) in the socket communication.
>  
> +Support for platforms other than Linux


It's not just Linux - any platform without eventfd.

So I think we should have a section explaining that whereever
spec says eventfd it can be a pipe if system does not
support creating eventfd.

> +--------------------------------------
> +
> +While vhost-user was initially developed targeting Linux, nowadays is
> +supported on any platform that provides the following features:
> +
> +- The ability to share a mapping injected into the guest between
> +  multiple processes, so both QEMU and the vhost-user daemon servicing
> +  the device can access simultaneously the memory regions containing
> +  the virtqueues and the data associated with each request.
> +
> +- AF_UNIX sockets with SCM_RIGHTS, so QEMU can communicate with the
> +  vhost-user daemon and send it file descriptors when needed.
> +
> +- Either eventfd or pipe/pipe2. On platforms where eventfd is not
> +  available, QEMU will automatically fallback to pipe2 or, as a last
> +  resort, pipe.
> +
>  Message Specification
>  =====================
>  
> -- 
> 2.35.1


