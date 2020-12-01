Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0882CAA45
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:56:03 +0100 (CET)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9sg-0001L2-JU
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk9ZH-0005Ol-UA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:36:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk9ZE-0004kL-Ea
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606844155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+DlMXO9Bw/tPqYhlTADUVjAaOID+5KcgZMrFscBnU4=;
 b=GKVKU/FS4JLfKfcixKuWXZEpCeQwxes0/ac7Bm1Nd1HyP8RUjSTppqDiJ84S3Bp5+n4RAk
 tAGvy2RCnSJYtx2hqhwH9nVZxfdE0h1cJm+8JfreWe0RpzTKgsLBC7qrOCJm5d5amgiye+
 FEGZn8vXkUHrp0qZir/kTwChv/lV7cQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418--sO4zMR5PNGi5aLZk08cvQ-1; Tue, 01 Dec 2020 12:35:53 -0500
X-MC-Unique: -sO4zMR5PNGi5aLZk08cvQ-1
Received: by mail-wm1-f70.google.com with SMTP id f12so1218195wmf.6
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 09:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+DlMXO9Bw/tPqYhlTADUVjAaOID+5KcgZMrFscBnU4=;
 b=Z+Qpx37Qx+yaHIHvRaUOE1qu3UjQJ1/SEFvSa5T/acw9xIp0txifDFul4+ldhZXpWU
 wfwxKzZqmrwF+AY+OTmeC0T0LW2BU6znUqBqOj57PC0VIhnHnp+1FLXo+HjIQn9SBHS0
 2PgLGnAxfVFPfMLcQOr/RxUoKasn+Qj2ttKAGNbbpLvkwxpsTJr71vaZa9SElgcTONvv
 UgozRMMH3PhHe5erE3h/oZmtJQ3eEdRG/6dIkenssl4pCi5fpY1+Y+qv4sVKobWKng9+
 zTpE2/PtPlScoqdjvMxDZTRS7Y7WKmbGCWMDkYr1LNPKZ2+ATQbut2iKy2fcIHa7oQg1
 eM3g==
X-Gm-Message-State: AOAM532CDvfXpAG29JDayBhrkMbXMegLWbwByTn11fi6/nOXS0c2giag
 lz/wyOkpPh+n3Fl6iTjL5d5e5f8EBiPmNy9C7KN1CCnB10ckeLGaPuG6mOSRDRN4mARM9+hfGW4
 Y6fgUvn8q4b1YDz8=
X-Received: by 2002:adf:9144:: with SMTP id j62mr5230427wrj.419.1606844152761; 
 Tue, 01 Dec 2020 09:35:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4eMYJF8UDB2VfcxKvL6c9Vjbl0NX0IHIa1EaQrQR3qF6UphsQxPJ9kKYLXrb2p2q2pGbJNQ==
X-Received: by 2002:adf:9144:: with SMTP id j62mr5230415wrj.419.1606844152643; 
 Tue, 01 Dec 2020 09:35:52 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id l13sm434161wrm.24.2020.12.01.09.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 09:35:52 -0800 (PST)
Subject: Re: [PATCH 07/23] tests/docker: fix sorting in package lists
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20201201171825.2243775-1-berrange@redhat.com>
 <20201201171825.2243775-8-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7bba5d89-b2b4-72dc-bd59-2e1239204d7b@redhat.com>
Date: Tue, 1 Dec 2020 18:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201171825.2243775-8-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 6:18 PM, Daniel P. Berrangé wrote:
> This wil make diffs in later patches clearer.

Typo "will".
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/centos7.docker    | 4 ++--
>  tests/docker/dockerfiles/fedora.docker     | 4 ++--
>  tests/docker/dockerfiles/ubuntu1804.docker | 4 ++--
>  tests/docker/dockerfiles/ubuntu2004.docker | 8 +++++---
>  4 files changed, 11 insertions(+), 9 deletions(-)


