Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375537B524
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:52:13 +0200 (CEST)
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggqy-0005Yp-FQ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lggpW-0003zW-TY
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lggpT-0002Pu-Fx
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620795038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0OOqxff1fz0fHL4Aok9PiwFwL4+gvRi8lk8wxk3Of1w=;
 b=T8EbEsEJf+NMvcyHAjwePkv9NkXw7LM2tLHjCYkhPPn21E1Kx/wEFDEqSQtw++O2BEEU+4
 JlXDcVf8CRiQVHKsmGJBnx9658FfNVFcU9a2+6Kwsqx1pIsrjzfVo+q6K/JD18iGs0gvtH
 xj9Ru1TlJiI727FYD3iO8615ourFOQ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-jNGMwFy_OTqrO16ezkoABA-1; Wed, 12 May 2021 00:50:37 -0400
X-MC-Unique: jNGMwFy_OTqrO16ezkoABA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so1116911wmc.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0OOqxff1fz0fHL4Aok9PiwFwL4+gvRi8lk8wxk3Of1w=;
 b=C7bs7Bhw8xe2dnQdKgDlgoAr9xb8PP2MifHWFEG93S96BFgM7wxIxuAtzesxSxT+/i
 WrpInXBqi0GdLrbE89qtE1Aa/piw3bFcYoAULe6CYE1YoK16nNpjft/48Kq+4egKIheo
 wmXQAsAZGUyJbnWPbxE5/7sKCMGTJT9rB0PlmaU0dEMgSDQIwFjwLlvNUSYCQiuOKFkl
 ZELsfLpP9YTZjZTsio6APEOJ6K0T487U5OCqKekYJ/LtNwAl+fc+/6y9nV7qvqMaxaAm
 Qx3luPN1Bb4kjiJ7dJxjQMUieTkIIzirkem/77Kfc4Ool8UnoVktP0Kv0bhoGV5y9Xl4
 KD7w==
X-Gm-Message-State: AOAM5339moMb2h11xCDY8ipWNLGHmx+yu75Y0zDzC21/UbJn9LcaVO5E
 04Qhg5ZF7CYST0dxGTExbmWaPM6Zi4tSDj6Wzr0X6aGiCeKQ7UypPqXDG7xKYlB2f9QCPANCZoK
 VggTGouahk8vg3+o=
X-Received: by 2002:adf:de09:: with SMTP id b9mr238322wrm.340.1620795036202;
 Tue, 11 May 2021 21:50:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL4nlblVsgw3x/0QX01zotuCtSJv+y9s5ROCAY4DxEQWLlYas7a26L2gE+zv1e5P5wvl+jxw==
X-Received: by 2002:adf:de09:: with SMTP id b9mr238310wrm.340.1620795036053;
 Tue, 11 May 2021 21:50:36 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x10sm2308150wro.66.2021.05.11.21.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 21:50:35 -0700 (PDT)
Subject: Re: [PATCH v2 30/30] configure: use cc, not host_cc to set cross_cc
 for build arch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210504100223.25427-1-alex.bennee@linaro.org>
 <20210504100223.25427-31-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d90e5a7c-1e23-0bbd-817b-d1590c0b3f16@redhat.com>
Date: Wed, 12 May 2021 06:50:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504100223.25427-31-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 12:02 PM, Alex Bennée wrote:
> Otherwise you run into hilarity like trying when cross compiling a 32
> bit ARM build on a 64 bit system trying to use host_cc to build 32 bit
> test cases.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


