Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7F249CFBE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:31:47 +0100 (CET)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClD0-0004qq-EV
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:31:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1nCl2w-0004mW-7w
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:21:22 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:59164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1nCl2t-0001oE-SX
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:21:21 -0500
Received: from [192.168.1.102] (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 97DE821C69;
 Wed, 26 Jan 2022 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1643214074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uqh4KsL2gMxH4281NwmFQFGLD8dC2GISW8I2RMN2qa4=;
 b=ogpc7z33MBwwcdMUM/Aq/9Fz4eULAw5sKBbS1ekso8hjBo5r/e7SQtZ6/5g7INvYH36dUS
 wfO8APCXkwFufLhVociCyuUFCWjw2v2zJu4Os762A31pnCJQ29JXVnuAyZ5RuwlKzKpMEK
 fUi+ErLeYDz0lSUwCkJURx1yLvHwMiI=
Subject: Re: KVM call minutes for 2022-01-25
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 quintela@redhat.com, kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
References: <87k0enrcr0.fsf@secure.mitica>
 <6ba8efb0-b4e0-dbda-e1f1-fac9dfa847fd@amsat.org>
From: Mirela Grujic <mirela.grujic@greensocs.com>
Message-ID: <9fa5088c-0f43-747a-77f3-90fb68a05945@greensocs.com>
Date: Wed, 26 Jan 2022 17:21:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6ba8efb0-b4e0-dbda-e1f1-fac9dfa847fd@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/25/22 5:54 PM, Philippe Mathieu-Daudé wrote:
> On 25/1/22 17:39, Juan Quintela wrote:
>>
>> Hi
>>
>> Today we have the KVM devel call.  We discussed how to create machines
>> from QMP without needing to recompile QEMU.
>>
>>
>> Three different problems:
>> - startup QMP (*)
>>    not discussed today
>> - one binary or two
>>    not discussed today
>> - being able to create machines dynamically.
>>    everybody agrees that we want this. Problem is how.
>> - current greensocs approach
>> - interested for all architectures, they need a couple of them
>>
>> what greensocs have:
>> - python program that is able to read a blob that have a device tree 
>> from the blob
>> - basically the machine type is empty and is configured from there
>> - 100 machines around 400 devices models
>> - Need to do the configuration before the machine construction happens
>> - different hotplug/coldplug
>> - How to describe devices that have multiple connections
>
> - problem realizing objects that have inter-dependent link properties
>
> Mirela, you mention an issue with TYPE_CPU_CLUSTER / TYPE_CPU, is that
> an example of this qom inter-link problem?
>

Yes, for cluster/cpu specifically it is the parent-child relationship 
between objects.


>> As the discussion is quite complicated, here is the recording of it.
>>
>> Later, Juan.
>>
>>
>> https://redhat.bluejeans.com/m/TFyaUsLqt3T/?share=True
>>
>> *: We will talk about this on the next call
>>
>>
>

