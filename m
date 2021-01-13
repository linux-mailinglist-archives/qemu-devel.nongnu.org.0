Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A378B2F4623
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:54 +0100 (CET)
Received: from localhost ([::1]:45820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzbPd-0005Lc-Ig
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 03:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzbOS-0004fz-Uj
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:20:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzbOM-0002DZ-Tg
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610526033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUrBfCPJi3GEw4n5+qcbz+s9HeTj5n9uNv0ANGI84D8=;
 b=JdLZIECKrl9jswGU//U6MxD9I8LuEuKiTWmtTbomzVg2HKZuaT22SdswRUJW1OB6juOXUc
 Bn7EZyXmdD91Vt0WYcxaZlKBQ767PIg0E8xxmj/S5QOxkeZ/RDan4/s/rcXPMlOR3XoabY
 2+vpC4Ag2viXwZ9vwaa9h6CmTNIjvrA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-rH1w8zF3OlemuTy0P5LFWQ-1; Wed, 13 Jan 2021 03:20:27 -0500
X-MC-Unique: rH1w8zF3OlemuTy0P5LFWQ-1
Received: by mail-ed1-f69.google.com with SMTP id e12so506578eds.19
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 00:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UUrBfCPJi3GEw4n5+qcbz+s9HeTj5n9uNv0ANGI84D8=;
 b=JomrC4ikhRLdE6DT4USYkM2qTy3G/uIKLybO6eUHjQusQSwtcolGFmOOIOBJMu4HDf
 fFsq+cc1y9aZWQ+43XVjSqK5OZsTyNQvwRDRsJOOW0kYyNKNFH9v35y910E8x6HDk083
 JqYNKgvD+K8yU56Z2ST6TlDVljAbmsPR/yLw0YOvSOwQYvf7ZrQmIsORpmCiWMG9T5Aj
 SgeRu++izg3rm3YHjA9ztc3gqlnUnfTAiuKsJv0LJXgEZKZXnCc5PW8nXJJub1/IgeRK
 hYBRR5QeMWLBRC1nEBIpmR/RGWC7HzfCObXGjm+UEWDRYDsE9vLO0X1IrMlakD8D5pUw
 a4Ww==
X-Gm-Message-State: AOAM531DLLrVJ+XZl4xJS2H99AfVSTWNxZJYAg3effiVFtO6ZHTkqZx0
 ugleeAF4+OBFcn9HbayZFrLauuHTo6F0miox3a62HpWPBBqZwys/lqR89jgjua4VBAXXKef7IXo
 xyvxeXxmKPF4P+ps=
X-Received: by 2002:a17:906:4d52:: with SMTP id
 b18mr671372ejv.405.1610526025984; 
 Wed, 13 Jan 2021 00:20:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0PdEgom0LJ/+sX2d2HFGz9Q/FmBCd6HQEGfWY9D7X5/citbNQ23EJzStWtTkXNjhzrJ5ZBw==
X-Received: by 2002:a17:906:4d52:: with SMTP id
 b18mr671363ejv.405.1610526025809; 
 Wed, 13 Jan 2021 00:20:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o10sm396950eju.89.2021.01.13.00.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 00:20:25 -0800 (PST)
To: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
Message-ID: <c1e768d9-24fe-f414-f684-1b1c908c09ce@redhat.com>
Date: Wed, 13 Jan 2021 09:20:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/21 23:37, John Snow wrote:
> - our configure file suggests bzip2 is an optional dependency (It's set 
> to 'auto') but meson will error out if it is not present at 
> configuration time:
> 
>      ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found

Yes, the configure option is for libbzip2, not bzip2.

Perhaps bzip2 could be required only if get_option('install_blobs') is 
true, I don't know.

> FROM alpine:latest
> 
> ENV PACKAGES \
>      wget \
>      xz \
>      python3 \
>      ninja \
>      gcc \
>      musl-dev \
>      pkgconfig \
>      glib-dev \
>      pixman-dev \
>      make \
>      bash \
>      perl
> 
> ENV QEMU_CONFIGURE_OPTS --disable-linux-user
> 
> RUN apk add $PACKAGES
> 
> RUN wget https://download.qemu.org/qemu-5.2.0.tar.xz && \
>      tar xvJf qemu-5.2.0.tar.xz
> 
> WORKDIR /qemu-5.2.0
> RUN ./configure $QEMU_CONFIGURE_OPTS && \
>      make -j9

This should be added to the CI!

> - diffutils is required for the qapi-schema test, which runs at build time. 

This is not required by meson because technically it is not needed 
except for "make check".

Perhaps we could do

-if build_docs
+if build_docs and diff.found()

in tests/qapi-schema/meson.build.

Paolo


