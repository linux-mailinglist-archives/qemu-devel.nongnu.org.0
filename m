Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA76358E5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 11:05:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxmcG-0007vf-TI; Wed, 23 Nov 2022 05:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxmbi-0007sW-N8
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxmbe-0007tj-TG
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669197827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1g0mKQvhCpHnfnN34ZTyUbpWKMU8G1Dtpgz2dfM5pro=;
 b=iP1vpDtmc+hTogZyY9Nq31AkMNdJWVMRk+19xOS0nyoQUQcHwYRAAdE+ZBofREhA6DszL/
 wOENobhQtzSYCmCxUzFx4Lam+6R7vf65QYxw0TCRMxkhiP0vIaqzHdUmalPIf/pn/bmF+f
 wIqim6ASfkqafQBK7gNqdmd0nQGtRpU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-k9_2fsr-MLaU6fLYChWNKA-1; Wed, 23 Nov 2022 05:03:46 -0500
X-MC-Unique: k9_2fsr-MLaU6fLYChWNKA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j30-20020adfa55e000000b00241b49be1a3so4801961wrb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 02:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1g0mKQvhCpHnfnN34ZTyUbpWKMU8G1Dtpgz2dfM5pro=;
 b=lX/fOZJJ/bNvQ8jgB5n9drzHPte7bz1qyQXMVc22TkkpCmtS8kDN60H60NQ78o4BMr
 YEycl9OoHQHiCu7U0xu1YfA9tA8xmeimJUWoX/iNCC/XF15wXicIg79A3FtrDonc39rF
 m/fUxR+DEgxg6r8F6A/LJKosPMcNYeoVzEuKYNZ6btBo852rz+/qZQyZiSZXmhAS3Fra
 ntlgoo+lnUBPv2NDcvJP8UayPTtx9ycW751E6ylfusw/oqWPIBP5IOlnY3GGPIJpzuBC
 osPHnkzefdWTIy016EutWmi4Ao5+ZPJMRhWP2zgqV6t6xXzu3LY9nwQj9K2qIC9+gq9X
 B09Q==
X-Gm-Message-State: ANoB5pmoGF6ydDGo+6yOwsA1RkV6HAezE/1z2yimK9FQ3X6V2Y07mqwu
 +fDCuNMWVeydzwe4OAkuFX3J9tvO0WODMNyNTlaKoeK0UH4ioDd/Q0y3RPFFWiIICiscigobFu7
 LurXlPTphczoRJuA=
X-Received: by 2002:adf:d08c:0:b0:236:783e:5947 with SMTP id
 y12-20020adfd08c000000b00236783e5947mr16537107wrh.168.1669197825425; 
 Wed, 23 Nov 2022 02:03:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59JMBfW8aKFR1Or/1uRNRyioFO8LMlXo2Fmo7y3Snzu/0rpqZlwzjI0z4mcO0eSHCfTxyK/A==
X-Received: by 2002:adf:d08c:0:b0:236:783e:5947 with SMTP id
 y12-20020adfd08c000000b00236783e5947mr16537081wrh.168.1669197825064; 
 Wed, 23 Nov 2022 02:03:45 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-58.web.vodafone.de.
 [109.43.178.58]) by smtp.gmail.com with ESMTPSA id
 e21-20020a05600c439500b003c6bd91caa5sm1659793wmn.17.2022.11.23.02.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:03:44 -0800 (PST)
Message-ID: <c2120c20-8105-bb78-8e11-6d7ab201f777@redhat.com>
Date: Wed, 23 Nov 2022 11:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <0dc256bb-d163-66de-a448-389e52c908d3@redhat.com>
In-Reply-To: <0dc256bb-d163-66de-a448-389e52c908d3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 18/11/2022 15.18, Thomas Huth wrote:
> On 18/11/2022 12.33, Alex Bennée wrote:
>> The old URL wasn't stable. I suspect the current URL will only be
>> stable for a few months so maybe we need another strategy for hosting
>> rootfs snapshots?
> 
> Looking at 
> http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/ 
> there are only images for the very last month available - so the new URL 
> will likely be invalid in one month already. That's not usable. I think 
> you've got to find another solution or remove the test.

Looking at that folder again, it seems there wasn't any more change within 
the last week ... so maybe it's not rotating so fast as I was thinking 
initially ... thus I guess we could give the patch a try, and if the current 
image finally disappears again, we still can think of a different solution.

Reviewed-by: Thomas Huth <thuth@redhat.com>




