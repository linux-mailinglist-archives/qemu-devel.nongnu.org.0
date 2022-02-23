Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49C4C1099
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:46:27 +0100 (CET)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpAA-0003ac-7U
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:46:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMoOs-0000Km-Bd
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:57:34 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:51096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMoOq-0001Wx-EZ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:57:33 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E0C6021C2B;
 Wed, 23 Feb 2022 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645610250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nr6xFW2zI/TufDPm1qAEUX0ZHWmzTRo7sN6ZjJNVH3Y=;
 b=Ns4eVpcinFrgQpHvgG70RBxGWwyinQHaskR+gE9oqgD2mCKBFRX2QfMoytq6eVLwbEglVo
 W77i4JmZ7jCUUDfSpTGfzoe1NPMxbL8t4ZEwskETMxxjv5S65ngBD5DsVlqSFytlG/kE59
 tKazw6nByST4v295+0YtnsZAlouKIK8=
Message-ID: <eb1d52ef-d358-57bd-1468-cff84ace8d20@greensocs.com>
Date: Wed, 23 Feb 2022 10:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/5] qmp-shell modifications for non-interactive use
Content-Language: en-US-large
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <87bkyzzb1q.fsf@pond.sub.org>
 <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com>
 <YhSrD/gmlMkumkah@redhat.com>
 <c3fb1a44-29ac-00a0-47f4-7f152977f4a5@greensocs.com>
 <YhS7nE+6++YN4exZ@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <YhS7nE+6++YN4exZ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/22/22 11:31, Daniel P. Berrangé wrote:
> On Tue, Feb 22, 2022 at 10:38:09AM +0100, Damien Hedde wrote:
>>
>>
>> Here I just wanted to propose a simple way to just send a
>> bunch of commands from a source file and stop if something unexpected
>> happens.
>> Only goal is to be able to share a file on the ml and allow people to
>> reproduce easily.
>> We can already redirect the input, but it is almost impossible to see
>> if something failed.
> 
> Yes, I see what you mean. So the problem with using 'socat' or similar
> is that we fill the input with commands and response appear asynchronously,
> so we can't match them up easily. This is actually a problem seen in the
> block I/O tests which just send QMP stuff in a batch.
> 
> While you could do this by invoking socat once for each command, that
> gets silly with the repeated QMP handshake for each command.
> 
> The thing about using qmp-shell is that it does a bunch of extra stuff
> targetted at humans on top, and history tells us it isn't a good idea
> to mix stuff for humans and machines in the same tool/interface.
> 
> How about instead creating a separate 'qmp-send' command that is not
> much more than a "QMP-aware socat".  By which I mean, it just reads
> raw QMP commands from stdin, sends each one to the server, but
> crucially waits for a reply after sending each, and stops on first
> error reponse.

By 'qmp-send' command, you mean another script in scripts/qmp ?
Yes

If we go for another script, I would rather do one with wrap
feature (like your series) to start qemu as well.

--
Damien

