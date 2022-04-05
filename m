Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320EF4F31E2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 14:49:52 +0200 (CEST)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbid4-00013s-LD
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 08:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbiYi-0008PZ-Ns
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 08:45:20 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbiYg-0006as-Hl
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 08:45:20 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E015A20779;
 Tue,  5 Apr 2022 12:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1649162716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8AbrDxvKoRKqYzStT2NSyxWFUeARYDoUrFdjXfZKhk=;
 b=vKAq7cIUNTpHgEKK+qRZ3kIP3CZUXDfWqqNqGEUxYPuelXKvTIyVacGscn7zv+eJH0Xqh0
 lw/IhejwpXSinQAq9RbCt4V8mMKlO41KxcRZk4NdACx0rukhFCckeIEry4qyc+MSeP/87p
 HOeJ0u+iJ85HbPRB4e9iMJmlKPxl9EQ=
Message-ID: <86b617c6-2cec-8570-5947-7e584fb1214b@greensocs.com>
Date: Tue, 5 Apr 2022 14:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp commands
 to qemu
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
 <YjG68xzV/qrMnhEW@redhat.com> <878rskccjv.fsf@pond.sub.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <878rskccjv.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/5/22 07:41, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Wed, Mar 16, 2022 at 10:54:55AM +0100, Damien Hedde wrote:
>>> It takes an input file containing raw qmp commands (concatenated json
>>> dicts) and send all commands one by one to a qmp server. When one
>>> command fails, it exits.
>>>
>>> As a convenience, it can also wrap the qemu process to avoid having
>>> to start qemu in background. When wrapping qemu, the program returns
>>> only when the qemu process terminates.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> [...]
> 
>>> I name that qmp-send as Daniel proposed, maybe qmp-test matches better
>>> what I'm doing there ?
>>
>> 'qmp-test' is a use case specific name. I think it is better to
>> name it based on functionality provided rather than anticipated
>> use case, since use cases evolve over time, hence 'qmp-send'.
> 
> Well, it doesn't just send, it also receives.
> 
> qmpcat, like netcat and socat?
> 

anyone against qmpcat ?
--
Damien

