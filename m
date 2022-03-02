Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B241B4C9AB3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 02:49:47 +0100 (CET)
Received: from localhost ([::1]:37572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPE7e-0006Qw-QA
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 20:49:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nPE6N-0005Km-2z
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nPE6E-0000Qh-Gh
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646185697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9h2jL0gaZ7x46yFFZzdH7DpfM/qByFdhGN1+1tT0jE=;
 b=BxyP4pJXhZnvKLhokSTwNudSo8CmSej568COL4baUXcLCYNSCWjLQzrad4BSk+jjMxOImd
 +h1fWZ7UqE3Sl1GVhPKriywRDOfB1+PMYXTGbUUbuxU5GqkkJuUctTzG+r6gRl8GN/W36T
 zmv+vodJ2uDbVDychpD/GOZCOmADfw4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-ZCNAeNvUP_CUc4inOCqc0g-1; Tue, 01 Mar 2022 20:48:15 -0500
X-MC-Unique: ZCNAeNvUP_CUc4inOCqc0g-1
Received: by mail-pj1-f70.google.com with SMTP id
 x17-20020a17090ab01100b001bbffb2c5f3so2386367pjq.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d9h2jL0gaZ7x46yFFZzdH7DpfM/qByFdhGN1+1tT0jE=;
 b=ywOctIv8tGrIvK1ECAs/2bLGLI2Kbmw5BforNq+485QqNB17gD02/OxKHU0whT5iy5
 QRciFrN2hTe1FdPoVb4+mZX5ag/WrxmXvu6omHQDLN7C7w/dpQt4rq2r2toyO8Vfr0CP
 d7IbC/4qUU3pBuhDSjvklzk+TqvweA6kTpIN6/rFxbGRdBrpHUBdJ0sNP27CDm7qu76b
 zU3g/H+WTGc3JtvV+WM2xjh7tkgHwucjya+B/taEF5fWXX0ftrKjR0TQMZxiPCakogyr
 mnZSTlQhgJdFQWgfQm4adTNpik5BBXCdHlntoL/M4kY1iY9wVPBqj/W6oGC+GpdyeP4e
 nvvw==
X-Gm-Message-State: AOAM5308EfDWVl/bxsZQZgNd/+e9Gjc0h+gOPSHzqq0BTDYWIvudXqTI
 sujycjIyC9nohcUKwkPWPv0UdtNLxt7SgqdoB/JpIc+1dR1SLDJIh3mUnp58WPdD0+tu+DNCK63
 QMVmz+ecxjY/+0FU=
X-Received: by 2002:a62:fb0d:0:b0:4f1:a584:71f with SMTP id
 x13-20020a62fb0d000000b004f1a584071fmr30731871pfm.2.1646185688836; 
 Tue, 01 Mar 2022 17:48:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXcyNNSYJ9yPeDX5XdLLMQMwVKJskw10luCelhbhpavAc8rseKSUBaLp6ZdttvCjnVPCAdcQ==
X-Received: by 2002:a62:fb0d:0:b0:4f1:a584:71f with SMTP id
 x13-20020a62fb0d000000b004f1a584071fmr30731858pfm.2.1646185688546; 
 Tue, 01 Mar 2022 17:48:08 -0800 (PST)
Received: from xz-m1.local ([94.177.118.101]) by smtp.gmail.com with ESMTPSA id
 b1-20020a630c01000000b003758d1a40easm13819566pgl.19.2022.03.01.17.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 17:48:08 -0800 (PST)
Date: Wed, 2 Mar 2022 09:48:02 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 00/25] migration: Postcopy Preemption
Message-ID: <Yh7M0kw4Jl6YjcCL@xz-m1.local>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5gfqvUktw+krlt@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yh5gfqvUktw+krlt@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 06:05:50PM +0000, Daniel P. Berrangé wrote:
> On Tue, Mar 01, 2022 at 06:55:00PM +0800, Peter Xu wrote:
> > On Tue, Mar 01, 2022 at 10:27:10AM +0000, Daniel P. Berrangé wrote:
> > So what I'm curious is why TLS is getting quite some attentions in the past
> > few years but I didn't even see any selftests included in migration-test on
> > tls.  That's something I wanted to look into, maybe even before adding the
> > preempt+tls support. But maybe I just missed something, as I didn't use tls
> > a lot in the past.
> 
> I'm going to send some patches for adding TLS to migration-test

That's great.  Please feel free to copy me, I can probably work the
preempt+tls upon, thanks.

-- 
Peter Xu


