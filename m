Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFC42E56A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 02:46:53 +0200 (CEST)
Received: from localhost ([::1]:42572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbBN6-000812-LE
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 20:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBK7-0006wc-6O
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:43:47 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBK1-0002JO-5i
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:43:46 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so6031772pjb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 17:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l5VR69niRqnB7hRqEbp2wbyAfEMMUJLa4DLI1jrEWKQ=;
 b=y5HMIjj8hyMBCnbxw0yvMZyOccfwdt7pHX71roiNd2tmjeee2WSCVn1JzfN7Zp5iap
 xnYaItnqhepop6dtjRlQTFZg5xvha2eJ4K/7p/tP9b92cTBlhy3aPX2fxxV0hSTqA40h
 H65dlhbOdLehFJyAC2OlaTFolmxesFCujD31e2T2WLZM0Yhh0mr7zfw7WYz87YOg6lbF
 8aPV/saSk5FNlPa1IgfZy+OmIvwpqS803nJouzZmtWnsA79QyhspmSo4XxBhmvXkzPFi
 NykIiyPkVfgOKaWzPM79k4SzbFVz/VM3+ygPikHXrTrw+OHlqzWu3OXpVXwnjhbnGrTI
 gtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l5VR69niRqnB7hRqEbp2wbyAfEMMUJLa4DLI1jrEWKQ=;
 b=RKkFfCRbB62QA4BCNpNugWFMR1PMMqMTyCzz15idEKbZWzEk7IK+VPdGsv+2IQHam7
 chve4m4sJaEPoGU8OzOj/wd8GmScrVOvN5fnSnNwVH6sBeizHe8a4mbx6hox1J0Yc0sS
 pGi42Jr1WGZJfcFMfOPfAqlxf324EqFKT7Ih+1TBnImnuL7895uTqTIxAd4PZfHU9QV7
 +JVEiiS+lCBjgKfROyny3PFax7ngWv8OOv/meBUW/XMASYf1EYTeMtfQfTzIJGtI8jVP
 GUgKxCITt40pmUliE+1p/8BlSbvsq28OM7J7pQn9DHZdAd0CLWhCGJmDFjZsJ8iNW6wL
 ZG8A==
X-Gm-Message-State: AOAM530+y1S5E5wQIIpwNFFN2P7NGwDVXQbma3JZBlouz6PJemXOptsx
 NHBpdO4UeOWpREBcoY34FCBm5g==
X-Google-Smtp-Source: ABdhPJwRH9tuhuDSpIDh7J+1XAL5D8lDpFEf1AvUxjY/0POd32x3DU+c3UP7WvjyMFsaD5YpkIaq5g==
X-Received: by 2002:a17:902:9b88:b0:13e:55b1:2939 with SMTP id
 y8-20020a1709029b8800b0013e55b12939mr8084943plp.80.1634258619582; 
 Thu, 14 Oct 2021 17:43:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j6sm3339974pgq.0.2021.10.14.17.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:43:39 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up
 to revision E.b
To: "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>
References: <20211014115643.756977-1-eric.auger@redhat.com>
 <20211014080436-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8cf6f07-adf7-63c5-bc92-486f9274acf0@linaro.org>
Date: Thu, 14 Oct 2021 17:43:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014080436-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 jean-philippe@linaro.org, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 5:05 AM, Michael S. Tsirkin wrote:
> On Thu, Oct 14, 2021 at 01:56:40PM +0200, Eric Auger wrote:
>> This series upgrades the ACPI IORT table up to the E.b
>> specification revision. One of the goal of this upgrade
>> is to allow the addition of RMR nodes along with the SMMUv3.
>>
>> The latest IORT specification (ARM DEN 0049E.b) can be found at
>> IO Remapping Table - Platform Design Document
>> https://developer.arm.com/documentation/den0049/latest/
>>
>> This series can be found at
>> https://github.com/eauger/qemu.git
>> branch: iort_Eb_v3
> 
> ACPI things look good
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ARM only so ARM tree?

Sure, I can take it through target-arm.


r~

