Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C05FE34B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:29:37 +0200 (CEST)
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj4pk-0007Em-0o
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj4mW-0002l3-KV
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj4mT-00010y-RV
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665692773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+SgzrB7fkze92lnQKpgRi7v/xJWja5PFW72ceI2VIkg=;
 b=AKtCkMb3jtcMD1eo0S9zIx0WmeLRErSCzCbzU+s1VhMCbUcTM63OtZ1oPWsvT6tWbkLe+P
 7qV3B3Dj6M7Y+R8A3/wcNk6K5iTxpERI1FYEj5r0l90uX8tom6fFq7qq4FoUCyUj/m+w+e
 My70pxQvXDlFd1ff/fwcOcnHx/LkBJM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-xwzWB9YMMG2gYi-CDVdw2Q-1; Thu, 13 Oct 2022 16:26:11 -0400
X-MC-Unique: xwzWB9YMMG2gYi-CDVdw2Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 gn33-20020a1709070d2100b00787e6fbcb72so1413035ejc.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 13:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+SgzrB7fkze92lnQKpgRi7v/xJWja5PFW72ceI2VIkg=;
 b=58KmhXNCNeZ/VaZbVfPyHo2YU3tvddniBdyY57hK8FGM+zqNOuLwRx/oEVQUPhCPJz
 v2OfErQp58HT04dDg/dDv1ugU3b6Bnl3hlOex9i/b5Hi39cfUDKO8XJZm/Ivh7lTtfJO
 lvana3T0ImGppw11kH9IH8KPl+KZkVDpXdNsjdPREerYC890/oYmLwrNp9cznSs3W1gM
 eGsfZR59vsm7cULsSNsqEuRPTGK9IRibO6lTunJacZomgQQ8szB7lmzqEr1Nr8n40WTJ
 S6+hwx0LNMLxMR2b5juSYIWqgeT0jILofggtN/YgmC5ULWtiYmbqCBWvVpp12cRxZjea
 Xmrw==
X-Gm-Message-State: ACrzQf2B72dkcJvRhYc7A6cB34IIhwn9b1znzq8l0wKKvZ5lW/OYzhER
 j7ijiSEov5offUxTYwCFV+3X4vJLlfYvGywVxPS9Pj59kEWVEJjVG12t3xg9tA7vzObgr+scAUV
 HgQHgqIx/z1boSpA=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr1122465ejt.526.1665692770650; 
 Thu, 13 Oct 2022 13:26:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5CZZtAx4CuaosOgFBTVAnXyO/mPQ7eiOB1viuzM+1voSgucdBWBTSBIdq/ol1UHSMg3cOduQ==
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr1122454ejt.526.1665692770395; 
 Thu, 13 Oct 2022 13:26:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 u13-20020aa7d54d000000b00458478a4295sm452695edr.9.2022.10.13.13.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 13:26:09 -0700 (PDT)
Message-ID: <bcdc0d01-e6a9-27af-2c54-7a789a43f7be@redhat.com>
Date: Thu, 13 Oct 2022 22:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 4/7] configure: don't enable cross compilers unless in
 target_list
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, stefanha@redhat.com, crosa@redhat.com
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
 <20221013154705.1846261-5-alex.bennee@linaro.org> <877d13pkr5.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <877d13pkr5.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/22 21:48, Alex Bennée wrote:
>> +  case " $target_list " in
>> +    " $1 ") ;;
>> +    *) return 1 ;;
>> +  esac
>> +
> this of course prevents building of roms by actually disabling all
> target compilers...

Yeah, two asterisks are missing.  I'll send out a proper patch.

Paolo


