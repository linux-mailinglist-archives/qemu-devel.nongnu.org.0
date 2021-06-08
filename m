Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1039F970
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:43:59 +0200 (CEST)
Received: from localhost ([::1]:43766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcxS-00089r-6F
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqcwN-0006SZ-Gs
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:42:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqcwK-0002XI-Ck
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623163367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClW0UWQgQDuHWw8kNI7ZJsTF923UcRS3+wmAMiBGX9Q=;
 b=RN7smTpEXvJW7UK0bIBMWeugm023difyVZBCSPhzKJBfmbyAgV9SIHfMJk3MqWp0JPGw9/
 lXLNMibE9ZFE53uQOBb6uxgasSjZxAESMQfAGkxaSxQIl+aGG88Y4IGUbbzzKs61nVPRDE
 p+Gs91qzhlsx180InQW3RPbAQG7F0Ms=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-qu6fMgHUM7OkWAGk-xg6og-1; Tue, 08 Jun 2021 10:42:46 -0400
X-MC-Unique: qu6fMgHUM7OkWAGk-xg6og-1
Received: by mail-wm1-f69.google.com with SMTP id
 a19-20020a1c98130000b02901960b3b5621so469077wme.8
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 07:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ClW0UWQgQDuHWw8kNI7ZJsTF923UcRS3+wmAMiBGX9Q=;
 b=erz2ptNKxtME4A/UoapQFiPZnT0eXFRJbWx4zPQKj96B5hMuveLa6tBPZ4rsmkBMUe
 9/Zwe2rGU+vZuldQeXPYaq3r97NnD2gnviCy0lWkx2MeaafojsjUPyfXlzc+ny2yGuMk
 zwAeByIIvwM+8q2zdMgHd4rgGtzX8z0vzHyTzcI4dD7TYI73wwI/ZSe7hWxHjv0CbqvD
 fqnd1nQgaqoOme9OVrMImmANcEH/t6PKmZoX+z/5WriFU7Dtgo6cbyzSJSQbGizgUPa6
 fpBVuxpcPsPoJmGx0lixuVyhE4orc5rOHeE0F4I32lrEyJXBR25PpZ6OTf2KPb+FAwKj
 uMiw==
X-Gm-Message-State: AOAM530ueja/Ve+7Opll3JOCybMUvqo6NEMlMqfFr5W3CmcKECTefTLZ
 25amzPNSR636MjXiSM+MF5kyqURdtsu5L18djy7QUaiaWAv9BFlA6rVyNiGfkFgczCpLL4BUOIH
 tzIes5BhDTQp+QVk=
X-Received: by 2002:a5d:6209:: with SMTP id y9mr23272949wru.50.1623163365128; 
 Tue, 08 Jun 2021 07:42:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2vL56ebGkM3zDbnwv5E/ImI+8Fqs1L1ZtdN1RLWKHU+pNaZPBCU10ykBnuZGv5OpHHpoA0Q==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr23272930wru.50.1623163364950; 
 Tue, 08 Jun 2021 07:42:44 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de.
 [217.232.61.128])
 by smtp.gmail.com with ESMTPSA id o9sm17641367wri.68.2021.06.08.07.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 07:42:44 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b0f5feb3-ce55-0307-f64c-c65d1528560a@redhat.com>
Date: Tue, 8 Jun 2021 16:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87im2ol8xu.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/2021 16.27, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>> machines is about to be broken...
>>
>> Um, what?
> 
> Really what we want is to probe the -M (machines) that a binary
> supports rather than just barfing the test because we've built a QEMU
> that doesn't support all the random 32 bit machines.

Ok, so this is rather about being able to use the qtests with custom QEMU 
builds where you tweaked the default-configs? That's certainly a valid 
endeavor, but then I think this patch is the wrong way to go. You should 
rather add a qtest_has_machine() function that checks whether a machine is 
available in the target binary or not, and then only add the tests to the 
test plan that match the list of available machines. (we have similar issues 
in downstream RHEL where we want to limit the amount of machines, so a 
qtest_has_machine() function would certainly be welcome)

  Thomas


