Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0C66589A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFY1v-0007R7-CI; Wed, 11 Jan 2023 05:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFY1k-0007Qb-3H
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:08:12 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFY1h-0003DW-Nz
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:08:11 -0500
Received: by mail-wr1-x436.google.com with SMTP id w1so14500469wrt.8
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JR6RvoQLWuc/R+oh6Nv6jEUzqziyI+IF3yqDohM411o=;
 b=cWtEcms+kPMbNBx7IXZcyJiCrAsu1UAm12UAvH4o4q5GMFfKxsVFyOPb7JXFWnG/eE
 vD+09TNKj1/PElLRVb6E6kteur32pHAlliOHDgzj+B0Tuaa5wzGnBE6IJMjq0AkEu3cJ
 I95ZgEe5QUEqVVLmLZD0AnAMo8aFipplAMwXX7RaSzc7m1k+lDLULCoMowjxyvp3iwts
 zxle6pYizV+lW6WJXZmABmBmEBFgXVvqr15/5HPTlM0Xrmt8iaVF5GdZgvQpjsFOwAKs
 V5ytylnPN3PNyiQv2lX/3KswT5N/AWzHYFLBn+bGk89wgvUbbgrqTwaUBQZNy1VHwW8J
 EsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JR6RvoQLWuc/R+oh6Nv6jEUzqziyI+IF3yqDohM411o=;
 b=JxNcCZ/VBZPOHpwRKbsmgSuPRY7n0vOzMbNmlFoI7q9qRPYMht1EsfEmJYuKwoZ4kv
 EMWLS834kaPXOqbxRwM3ESFWJu2Pvn+8sotrHFg/jPhCZ0bLEzWoP3Bkdvo/pHV//dRP
 4L9oBy02Cvj7N25ndvbF+g11IiBrX28X8gzkM6shhzbaxxO9EX2uuZs4M8cmXlbOsbm4
 TATl7Cx0iaZQMLN0+LGlH2VTgzVnNFYi/7NP+dThq5fJLrsJzYN9Xfk4lyd3WyzPPbX2
 hLhB29uOO8DmI0+25iMzjC1YkQMUzrVFEGw4fu90/Rac0gtyOThkcM2lu3VN71RCY4Du
 gKBQ==
X-Gm-Message-State: AFqh2komyFUcpDcA1Nu8WO/ae0+ygWi0l+TfYp+ZCFk6mRpQ3JQci7ae
 juYHQF1PfFgYrTu5a+nf6BHxYw==
X-Google-Smtp-Source: AMrXdXvuScJPOuNCSYQIJ3KobtEk032RMis/yXDk2+OvTk9pvNP2uMf9yBCOhRHtiKKpJgb7MsrxYQ==
X-Received: by 2002:a05:6000:1d87:b0:242:7409:bbf with SMTP id
 bk7-20020a0560001d8700b0024274090bbfmr40150845wrb.54.1673431687463; 
 Wed, 11 Jan 2023 02:08:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i6-20020adfe486000000b002423dc3b1a9sm13159820wrm.52.2023.01.11.02.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:08:07 -0800 (PST)
Message-ID: <9a3d8a73-9d41-8cb6-e271-7753347f238d@linaro.org>
Date: Wed, 11 Jan 2023 11:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 0/4] qom: Introduce object_class_property_deprecate()
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230109225419.22621-1-philmd@linaro.org>
 <Y71h8JAqYxeB2hPe@redhat.com>
 <53028cf2-0028-b810-348f-b17df33a8149@linaro.org>
 <Y76IdVNKyIBAZLrl@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y76IdVNKyIBAZLrl@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 11/1/23 10:59, Daniel P. Berrangé wrote:
> On Wed, Jan 11, 2023 at 10:55:47AM +0100, Philippe Mathieu-Daudé wrote:
>> On 10/1/23 14:02, Kevin Wolf wrote:
>>> Am 09.01.2023 um 23:54 hat Philippe Mathieu-Daudé geschrieben:
>>>> Hi,
>>>>
>>>> There will always be a need to deprecate things. Here I'm
>>>> tackling the QOM (class) properties, since they can be set
>>>> from some CLI options (-object -device -global ...).
>>>>
>>>> As an experiment, we add object_class_property_deprecate()
>>>> to register a class property as deprecated (since some version),
>>>> then we deprecate the TYPE_PFLASH_CFI02 'width' property, and
>>>> finally as a bonus we emit a warning when the deprecation period
>>>> is over, as a reminder. (For that we introduce few 'versions'
>>>> helpers).
>>>
>>> The last part means that increasing the version number (i.e. the commit
>>> that opens the development tree for the next release) can change the
>>> output, and this is turn can break test cases.
>>>
>>> If we are happy to introduce breakage with a version number change that
>>> will require future commits to open the development tree less trivial
>>> than they are today because they need to fix the breakage, too, why not
>>> make it a build error instead of a different warning message at runtime?
>>
>> To avoid build breakages, maybe it is clever is to store the deprecation
>> version in ObjectPropertyInfo and let QAPI inspection scripts enumerate
>> / report deprecated features?
> 
> I don't think we want the version information in the code nor
> introspectable at all.
> 
> We want applications to only apply logic based off features that are
> actually available, not predicted future versions where something may
> or may not be removed. This is why we exposed only a plain 'deprecated'
> boolean field in QAPI schema for other deprecations.  This is just a
> warning to be ready for something to change in future. If an application
> has not been updated they are fine to carry on using the deprecated
> feature. If an application has been updated, they should probe for
> existance of the new feature and use that if available, in preference
> to the deprecated feature. There's no reason for an application to
> consider version numbers.

Right, but "applications" can also be developer scripts right? Not
only user / sysadmin.

In particular, some HMP commands are only useful for developers, and
they are implemented over QMP -> QAPI. So we already expose extra
developer information via QAPI.

