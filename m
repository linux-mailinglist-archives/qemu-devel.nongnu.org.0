Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0216CDA4A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:17:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVfR-0000Eu-FR; Wed, 29 Mar 2023 09:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phVfO-0008Q0-41
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:16:42 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phVfJ-0001Fj-Ct
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:16:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id o32so8896772wms.1
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 06:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680095795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mEcR5wFOPsUUvRKVKjOXZzPujLVDq6iSfUcMfQ/xKjM=;
 b=vFy5PRj4luKS5QPL7isGON2KQgp+7unKFC+vpX5a+3G70NqlSnf+2VjpkaO3KuIVAV
 U7LWbUm/YVpY3WTlZ+KCbwPSqctYijRtpl0GMJJcyntmCnkL2OBSEbGIvEOLq9ZklcuI
 rBMKwlfrPFIF3IjhtmiIAgB+QNxzNJmgrNjljX77UJtp/CmtnqN4g8vAJbMra0BsL3ZB
 KbJwPfJeh6hVjJz4uG9IAMjO7O+SOIKzM12M/ZhWV/nfdmXRpu5vJsEgml1jyMah60Ly
 LeO6XqMwmEpeu1H+GbIBafNCikjmQzQo0xWQy56aZFlobBXeYS9dpsESiUoUIDctqPwl
 q13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mEcR5wFOPsUUvRKVKjOXZzPujLVDq6iSfUcMfQ/xKjM=;
 b=RoMw3hqa/pNa7P8+GDtjJxqyczWo33lTb3NzxsB+ak9BjxcCNwfCSKYyZ1S4wbzdFZ
 BexM34jv4jHMeDmfBq0F3p32oVJiLSDjflLc2oNhOhePZz0EbL9yGc/LavQlO15coO7+
 lFpyqXWiEb+vKAoFeXvOofPvBHFTca/FcgUDfst9FnoK0jJd35xpd8SbXGvyqK5+w6+/
 X1/nZyMENE+mhaR2XXTrX73TYjND9WmxNzo+if6xOgGs/WWmAw8aU0CCKfNyL6zM5+ev
 yj6vePK9jwETFe8dbTFNa530f7I227fNeut7xNhFytR4DqBolegrCf0BDW+8K89BqljF
 Tjfw==
X-Gm-Message-State: AAQBX9d5o88oJ/cdlXpdA0eUUtHXGnKAtb22mHUvI9EwEV1hX/vKpZtC
 NwIoEZyXkEJ+OaPKyqsl2q6H/w==
X-Google-Smtp-Source: AKy350ZR21fS6SM37sTUo2YhgvJkjiPDCN/X0l2y4M9zLDPeAdFDgu1tNkkCzIcbMe5XhY6qhT+XUg==
X-Received: by 2002:a7b:cd93:0:b0:3ed:346d:4534 with SMTP id
 y19-20020a7bcd93000000b003ed346d4534mr1848199wmj.0.1680095794772; 
 Wed, 29 Mar 2023 06:16:34 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003ee9f396dcesm2349988wmq.30.2023.03.29.06.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 06:16:34 -0700 (PDT)
Message-ID: <1f4b4215-32ea-dc55-16ea-98c6870fc532@linaro.org>
Date: Wed, 29 Mar 2023 15:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] tests/vm: use the default system python for NetBSD
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>
References: <20230329124601.822209-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230329124601.822209-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/3/23 14:46, Daniel P. Berrangé wrote:
> Currently our NetBSD VM recipe requests instal of the python37 package
> and explicitly tells QEMU to use that version of python. Since the
> NetBSD base ISO was updated to version 9.3 though, the default system
> python version is 3.9 which is sufficiently new for QEMU to rely on.
> Rather than requesting an older python, just test against the default
> system python which is what most users will have.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/vm/netbsd | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


