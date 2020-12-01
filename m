Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055142CAA3E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:54:20 +0100 (CET)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9r0-0007p6-PD
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk9aH-0006Pe-L9
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:37:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk9aC-0004xq-U4
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606844213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qihgts6Kx9DRx8V89W2/kTLYKts/re1RgtuhQaO2If4=;
 b=Zs3Vp+qNnRo9VwV1KhS8cAsKM+HEfs6rUnFMHuCMB+pZnKhPMKHGqP34Le+usI7tYUD+y5
 ZVUBQOpXkAhykYMl2VT5rs8DfuhEwjl5gdil43VXxnoytfvil+1l6FjzwHMI3DS8gEkP/4
 ndOFGPbnJ2IIVB6/T+Q1/vWRXRL9aZg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-FSA4PHPJN4GWXRyWJCkcDw-1; Tue, 01 Dec 2020 12:36:50 -0500
X-MC-Unique: FSA4PHPJN4GWXRyWJCkcDw-1
Received: by mail-wm1-f72.google.com with SMTP id j62so1232909wma.4
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 09:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qihgts6Kx9DRx8V89W2/kTLYKts/re1RgtuhQaO2If4=;
 b=FeTDnttTbwDifiT76EFh6MEDrWFTBrz0UtCFUc0tXetr+zTqO7ezDn82p498adPWy6
 Id1lD7QpPNxOnA+UdfCu7X+PZvYp77GpT78z1K6oCh4WTFwM1Z12iOQN+YaOCpHNr/gB
 z1ZEh5FDNzNYZRz8fVR40ZoerTluQV2VnGRk/1etQ5KIu2nxyHUU4+ZO1z8UfnQMDXjx
 pQuon9yLwLwZqLGcMUB0lv7Z3uQkqsq2C8JjqqkFjn5LgAF5EtEFB0O0Hi7GKfz+j04d
 vwQPAIZsL/fS4g29tlPwJkneIqU1mO/F5JHJVN48eli/83w/E9pV9oYotjWCpbvBbyLC
 ylGw==
X-Gm-Message-State: AOAM5333scVX+HZXWopE3LxovIek9MRC9IYjtoSI/yo3z2Tnfpo09lSQ
 9KCFVa5xVHR9fIP162LP7bOvVL/o/mbHO1G1SfM++O5lKMR0qxqGH6Hao/l/yRiSIXWI9NU+dLm
 So3Zj7iDdYRqkJm8=
X-Received: by 2002:adf:f602:: with SMTP id t2mr5446624wrp.40.1606844209144;
 Tue, 01 Dec 2020 09:36:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmhu4KQ0yV5SFyhcNK4OjGBMeo4+J/j+BLyPFABo4iD0rYWhOdZVwI/Y3TFR9XiGOO5Bz9ag==
X-Received: by 2002:adf:f602:: with SMTP id t2mr5446602wrp.40.1606844209032;
 Tue, 01 Dec 2020 09:36:49 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id y18sm439484wrr.67.2020.12.01.09.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 09:36:48 -0800 (PST)
Subject: Re: [PATCH 09/23] tests/docker: fix mistakes in fedora package list
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20201201171825.2243775-1-berrange@redhat.com>
 <20201201171825.2243775-10-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <00f4b32b-a5df-a702-09d6-fc9a89de07be@redhat.com>
Date: Tue, 1 Dec 2020 18:36:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201171825.2243775-10-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
> llvm is not required by QEMU, just clang.
> 
> libblockdev-mpath-devel is not used by QEMU, rather it wants
> device-mapper-multipath-devel.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora.docker | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


