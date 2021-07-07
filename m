Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88A3BE040
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:27:16 +0200 (CEST)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vPG-000337-JG
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vIX-0006gB-Dp; Tue, 06 Jul 2021 20:20:17 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vIU-0000cK-OC; Tue, 06 Jul 2021 20:20:17 -0400
Received: by mail-pf1-x42e.google.com with SMTP id f17so579693pfj.8;
 Tue, 06 Jul 2021 17:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IqkczpG5Qaqztj/JwGxUkaLLp5BN4GNr+Elzqu2Monk=;
 b=T44PGcpwDjTe/JovOYYYogW4qped6gfTWJf1RpXjg1nhh+h35MCcT9tLCadoGwJrIU
 6mCa7i61JtNf19XuGdo7rWcgbor9H0qD5Ut8Xn8kRO3zutS6QQN5RA81CUZH/VBvuhUS
 XPPOaFgDE0F5qRUiiq4R9kUzGJo29gi6CrPoXUAYu5MqUDkWK5xVdkd4Ha+CYAMuMNJk
 71O95sHVBjjptq+JUeos5HOylRvp/Nyo58OdZzqhBhenEilLRLUM7rslm64qHgSXc+Uw
 fh30rPxJkLAZE//Gn6UVBqCLQQwAGej4DplPpEXGUdX4xJbQGea8YbOECxY9hev2tilo
 nOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IqkczpG5Qaqztj/JwGxUkaLLp5BN4GNr+Elzqu2Monk=;
 b=s98Z6WCmMD9QVT7GGeCcuT3nvmiUfH6vgyG+ck3G9lIs2AbOq0VDSc7RWoStVoko+a
 T4rQX10MoNd3dl//PjV9s29lWfF73C4nwNM00j0h0/aHm98rI0q66g0WWqDtV99YvBlX
 Ee3qV5sYu7M9JzgAfrF0l61a7IYQBswxSMhkrAqZQbXkAnGTwujyUf8GcaVr8UmOIdNG
 lPZBQzeRSQiYusP+Xii1E+Tbx32rUHmQ+thGrFUzmz63+/E67n60ukbq3ddmI0386rhf
 sQJWuL25Ria7APpNuef0MCp4bTFh3bPUO+EcKlj1qyhc1sWukQ2s9qv0U9BodhTFEfUs
 SZ0g==
X-Gm-Message-State: AOAM530Khk1fY6MNvK6VKoUW5uG7QrEiJ5BvPGBHOi8ksaz42BEV8jcP
 AOOSgxCppVn6/By3TFgT1Sk=
X-Google-Smtp-Source: ABdhPJyUiBUXy4xoiasd5CKEQMiwt20/KEEdH1LLb/k3UBZbh/hnZJ0wvY74AlXGYyfpDOS1zciV4w==
X-Received: by 2002:a63:4719:: with SMTP id u25mr23639434pga.193.1625617212834; 
 Tue, 06 Jul 2021 17:20:12 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:7611:b123:7cbc:3065:30b1?
 ([2804:431:c7c7:7611:b123:7cbc:3065:30b1])
 by smtp.gmail.com with ESMTPSA id y4sm6400602pfa.14.2021.07.06.17.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 17:20:12 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210621205907.244841-1-danielhb413@gmail.com>
 <20210621205907.244841-2-danielhb413@gmail.com> <YOKQBhdJcDMm2noC@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <96b2510d-1406-2014-88da-66454cd6de32@gmail.com>
Date: Tue, 6 Jul 2021 21:20:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOKQBhdJcDMm2noC@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 eblake@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/5/21 1:52 AM, David Gibson wrote:
> On Mon, Jun 21, 2021 at 05:59:05PM -0300, Daniel Henrique Barboza wrote:
>> At this moment we only provide one event to report a hotunplug error,
>> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
>> machine is now able to report unplug errors for other device types, such
>> 	as CPUs.
> 
> Something seems to have gone weirdly wrong with the formatting here.

I have no idea what happened lol


> 
>> 	Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
>> 	create a generic DEVICE_UNPLUG_ERROR event that can be used by all
>> 	unplug errors in the future.
>>
>> 	With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.
>>
>> 	Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Apart from that
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Thanks for the reviews! I'll resend the series (hopefully with the proper
formatting) with your R-bs.



Daniel

> 
>> 	---
>> 	 docs/system/deprecated.rst | 10 ++++++++++
>> 	 qapi/machine.json          |  6 +++++-
>> 	 qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
>> 	 3 files changed, 41 insertions(+), 2 deletions(-)
>>
>> 	diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>> 	index e2e0090878..c8200d99d4 100644
>> 	--- a/docs/system/deprecated.rst
>> 	+++ b/docs/system/deprecated.rst
>> 	@@ -192,6 +192,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>> 	 (the ISA has never been upstreamed to a compiler toolchain). Therefore
>> 	 this CPU is also deprecated.
>> 	
>> 	+
>> 	+QEMU API (QAPI) events
>> 	+----------------------
>> 	+
>> 	+``MEM_UNPLUG_ERROR`` (since 6.1)
>> 	+''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> 	+
>> 	+Use the more generic event ``DEVICE_UNPLUG_ERROR`` instead.
>> 	+
>> 	+
>> 	 System emulator machines
>> 	 ------------------------
>> 	
>> 	diff --git a/qapi/machine.json b/qapi/machine.json
>> 	index e4d0f9b24f..91dc520734 100644
>> 	--- a/qapi/machine.json
>> 	+++ b/qapi/machine.json
>> 	@@ -1271,6 +1271,9 @@
>> 	 #
>> 	 # @msg: Informative message
>> 	 #
>> 	+# Features:
>> 	+# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_ERROR instead.
>> 	+#
>> 	 # Since: 2.4
>> 	 #
>> 	 # Example:
>> 	@@ -1283,4 +1286,5 @@
>> 	 #
>> 	 ##
>> 	 { 'event': 'MEM_UNPLUG_ERROR',
>> 	-  'data': { 'device': 'str', 'msg': 'str' } }
>> 	+  'data': { 'device': 'str', 'msg': 'str' },
>> 	+  'features': ['deprecated'] }
>> 	diff --git a/qapi/qdev.json b/qapi/qdev.json
>> 	index b83178220b..349d7439fa 100644
>> 	--- a/qapi/qdev.json
>> 	+++ b/qapi/qdev.json
>> 	@@ -84,7 +84,9 @@
>> 	 #        This command merely requests that the guest begin the hot removal
>> 	 #        process.  Completion of the device removal process is signaled with a
>> 	 #        DEVICE_DELETED event. Guest reset will automatically complete removal
>> 	-#        for all devices.
>> 	+#        for all devices. If an error in the hot removal process is detected,
>> 	+#        the device will not be removed and a DEVICE_UNPLUG_ERROR event is
>> 	+#        sent.
>> 	 #
>> 	 # Since: 0.14
>> 	 #
>> 	@@ -124,3 +126,26 @@
>> 	 ##
>> 	 { 'event': 'DEVICE_DELETED',
>> 	   'data': { '*device': 'str', 'path': 'str' } }
>> 	+
>> 	+##
>> 	+# @DEVICE_UNPLUG_ERROR:
>> 	+#
>> 	+# Emitted when a device hot unplug error occurs.
>> 	+#
>> 	+# @device: device name
>> 	+#
>> 	+# @msg: Informative message
>> 	+#
>> 	+# Since: 6.1
>> 	+#
>> 	+# Example:
>> 	+#
>> 	+# <- { "event": "DEVICE_UNPLUG_ERROR"
>> 	+#      "data": { "device": "dimm1",
>> 	+#                "msg": "Memory hotunplug rejected by the guest for device dimm1"
>> 	+#      },
>> 	+#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
>> 	+#
>> 	+##
>> 	+{ 'event': 'DEVICE_UNPLUG_ERROR',
>> 	+  'data': { 'device': 'str', 'msg': 'str' } }
>>
> 

