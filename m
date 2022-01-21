Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BC495E9C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:52:44 +0100 (CET)
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsTC-0004fy-Sy
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:52:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsDQ-0006zz-G4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:36:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsDN-0003PZ-SO
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642764977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqxe6ifB+rYSToildJ0VxxIDuD54yST4PD8hITnKKrA=;
 b=SJfvyNMIfUY3b90mbT4AkZXyqtjA863g7vQFAw8j2o/DcOSYCWoZ3+nhtdnpHgSaP/5goL
 k0Np5I9NAlJ4xZmu0vIsJJkxIOolWVqh6oTMRobcXbKVy+Sr2gq/PcyFeuw/Ho5vyEw8cy
 8811Zl6rNctE1Rr6f277a4qX9z01BBE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-TfbyLgghNkmc0tCo5LQOkw-1; Fri, 21 Jan 2022 06:36:16 -0500
X-MC-Unique: TfbyLgghNkmc0tCo5LQOkw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o3-20020a05600c4fc300b0034aee9534bdso4558802wmq.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 03:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jqxe6ifB+rYSToildJ0VxxIDuD54yST4PD8hITnKKrA=;
 b=yLdk+6Pm7ByxNjBWjHjO6qfP+0hZ2bVRoWFAEALllHrQFqM8hG/esX7lcqke0e/Q72
 Zbr//4pCpTy73nbZmflKmFXRsDh+0aRvS079h1qo6JVMYgd9TPCtFuL6wtd7Ee11kyj5
 cx2r0KoG1ysRVonLgOmFWzC/KbB+kiavsEvKW+xGBvxxTwS3KI1UNzjLiOKoeN3o/3un
 hRrLo7LtYY0aOU2XVSK/E74n5pEnoze3o5x3+klJ0FxlsSu7zeeNLwc505onq6wyTVAm
 sDiNi5Ise+ejOyRRX0kKQYSs2QITiF8p+CF332sh79nRas1teYPiPa1khkQJNQsnitpu
 jLtA==
X-Gm-Message-State: AOAM533wTRi6yWeGedb4b6lz0Ow52GFLNVtdmiv6eJC+7JcxoP4WYeW2
 8t809pdp1ij6fk8Ui4iRbnJK66ysTXya8dzzD8Qas9qh/Qev8kiLMk8ZXonWBvgd6FUVFez1kX8
 dlNb4G1v9d2DCYUQ=
X-Received: by 2002:a05:600c:21cf:: with SMTP id
 x15mr361645wmj.8.1642764974658; 
 Fri, 21 Jan 2022 03:36:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYCBzramcCUBRZupqF5TdErYWiK3xBhIKMg1a4maYyrf9FvmqQ4VhHW1+5rDztvOcKvpcp3Q==
X-Received: by 2002:a05:600c:21cf:: with SMTP id
 x15mr361633wmj.8.1642764974500; 
 Fri, 21 Jan 2022 03:36:14 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id bh26sm4665611wmb.40.2022.01.21.03.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 03:36:13 -0800 (PST)
Message-ID: <be46556b-f3d9-3e81-d980-a8bc664f7db4@redhat.com>
Date: Fri, 21 Jan 2022 12:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/8] gitmodules: Correct libvirt-ci URL
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220121103623.288054-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2022 11.36, Philippe Mathieu-Daudé wrote:
> Correct the libvirt-ci repository URL to avoid this warning when
> cloning / refreshing the submodule:
> 
>    warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/
> 
> Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitmodules | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitmodules b/.gitmodules
> index 84425d87e28..f4b6a9b4012 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -66,4 +66,4 @@
>   	url = https://gitlab.com/qemu-project/vbootrom.git
>   [submodule "tests/lcitool/libvirt-ci"]
>   	path = tests/lcitool/libvirt-ci
> -	url = http://gitlab.com/libvirt/libvirt-ci
> +	url = https://gitlab.com/libvirt/libvirt-ci.git

Reviewed-by: Thomas Huth <thuth@redhat.com>


