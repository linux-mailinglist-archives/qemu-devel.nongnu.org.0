Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A754E4474
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:44:20 +0100 (CET)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhcJ-0002Dh-Em
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:44:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWhZH-0005P5-5k
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWhZF-0000nm-H0
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647967269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBUR85jicxpG+zAgCiKZsqt+MH5a/ix/fUhecGnyR60=;
 b=FPNpl56LEdRdKfHIDEeo3iKsJWrY8CvpgKpvVUslbeTri7RjQPBHHPI/LOlKHC/aFRK2s1
 W7JsNbAZKwIA9x7OIODrEPzSbTWlnJSEk9au0K2QIleecJHv9LWg9MCFBdsmye7qHpSdM3
 WR5juTh2qdKo+jPl9gIJZP58oYyE4BI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-hktk0kj-N0iPH8QlGXbmwQ-1; Tue, 22 Mar 2022 12:41:05 -0400
X-MC-Unique: hktk0kj-N0iPH8QlGXbmwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg28-20020a05600c3c9c00b0038c8da4d9b3so1673104wmb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VBUR85jicxpG+zAgCiKZsqt+MH5a/ix/fUhecGnyR60=;
 b=NtcJlJPT6NgKQvjc75Fc8sU07SBgljSS7K+MtheFKEKY+hzXybDye03wxajACtRKpW
 F6U/AvEFDYC2ako+4Wa6d0Sd5qTbW6+sXYX6MOYzhGR6OZNsCKk6l2bb5SpNFiCzV+P4
 XpHvCq6Zuetuu/SxeRmj+0nmCc9JT70Zm5IMTZmoMwcCqNJb2st3DugUo3/yhfQDWkE2
 QS1IgiUec4/fdLO/Cgilnw1tDSQMi1pGlKyte44pR53gkkhQ0TFO9yKNY+8ZZ/M2pUc/
 MQHqHdDwX9lnBMcLbm9O1Jlahwuu9UOeywAeBtXQhhXN3XSieBwpZnAOO0iIQUp8eY9j
 Jv8A==
X-Gm-Message-State: AOAM533UDyLWaYu3Dz8gaRyZuYYeyKmbjMQqSOu5+L+i3E2mK+Q/jzo4
 B2IbJNvq12UfQ4yq6+q+UgSPmnFCxCJ68vi/Z/FcvPqA5TEeVw9AZ/H76wRBkd3s0Bp5sGkTeqX
 9N2h4ZYF/UDQtUO8=
X-Received: by 2002:a5d:5044:0:b0:204:116:8e8f with SMTP id
 h4-20020a5d5044000000b0020401168e8fmr13656646wrt.112.1647967264595; 
 Tue, 22 Mar 2022 09:41:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvWW5CZQQ2IbQAVU9L7hdq1DzmgvBZDMr2j6tcEIE61zzN+7WauTWtKGeRpBQYfl6bXJVHUQ==
X-Received: by 2002:a5d:5044:0:b0:204:116:8e8f with SMTP id
 h4-20020a5d5044000000b0020401168e8fmr13656627wrt.112.1647967264290; 
 Tue, 22 Mar 2022 09:41:04 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 i5-20020adfaac5000000b00203fd04bf86sm10030899wrc.66.2022.03.22.09.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:41:03 -0700 (PDT)
Message-ID: <c767375a-6dd6-0929-e59c-2930b809cb9a@redhat.com>
Date: Tue, 22 Mar 2022 17:41:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1 1/2] s390x/cpu_models: drop "msa5" from the TCG "max"
 model
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220322112256.118417-1-david@redhat.com>
 <20220322112256.118417-2-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220322112256.118417-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2022 12.22, David Hildenbrand wrote:
> We don't include the "msa5" feature in the "qemu" model because it
> generates a warning. The PoP states:
> 
> "The message-security-assist extension 5 requires
> the secure-hash-algorithm (SHA-512) capabilities of
> the message-security-assist extension 2 as a prereq-
> uisite. (March, 2015)"
> 
> As SHA-512 won't be supported in the near future, let's just drop the
> feature from the "max" model. This avoids the warning and allows us for
> making the "max" model match the "qemu" model (except for compat
> machines). We don't lose much, as we only implement the function stubs
> for MSA, exclusing any real subfunctions.

s/exclusing/excluding/
(but no need to respin just because of this)

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/897
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/gen-features.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 22846121c4..7b4430f9de 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -743,8 +743,6 @@ static uint16_t qemu_LATEST[] = {
>   };
>   /* add all new definitions before this point */
>   static uint16_t qemu_MAX[] = {
> -    /* generates a dependency warning, leave it out for now */
> -    S390_FEAT_MSA_EXT_5,
>   };
>   
>   /****** END FEATURE DEFS ******/

Reviewed-by: Thomas Huth <thuth@redhat.com>


