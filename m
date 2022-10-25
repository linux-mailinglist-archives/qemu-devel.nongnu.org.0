Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6672C60D001
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:10:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLTu-0005is-LM; Tue, 25 Oct 2022 11:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1onLTq-0005NR-DX
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:04:38 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1onLTp-0001wQ-0X
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:04:38 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4MxZwg6NDcz8PbN;
 Tue, 25 Oct 2022 11:04:35 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=K7z6S47JX
 4+pLMGttQscljRqpBA=; b=Vx+Ej6iy86MFzbjfu4YBeqvsEq6YVCfjDLN0wzSrS
 UK5q2myPhhTDvFrKTMvUGzBYaWLGXzCVHF67UI1GqbL+y45T6Ta/itCUN0BMdKIJ
 VK0IFBHY+dQGq+Xb2uwlZG0ySwQ38Xy/l9WzclMElXs3nT8BK4BxXM35Y4hHB09Z
 0k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=Oot
 XOLrR3YApMyyaE2u59j5GMp4D9WKzv1DyqQH0js+6DkYLjsGmIfIZAsEKkKXQaxT
 bDNy/VjcQwwIpohkbqEh7ZD72/ZRR6yNVUZT2Xzwa/CWNNkxwBff9u8cErqTxIUr
 jMoQKCQMkQtBR0jWl185mBdkZ59wu/RGDXO42qwc=
Received: from [IPV6:2001:470:b0db:100:81fa:abd1:4d81:3f82] (unknown
 [IPv6:2001:470:b0db:100:81fa:abd1:4d81:3f82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4MxZwg5L08z8PbK;
 Tue, 25 Oct 2022 11:04:35 -0400 (EDT)
Message-ID: <37265a07-2ac0-1c8f-ba34-4b1983737c85@comstyle.com>
Date: Tue, 25 Oct 2022 11:04:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101
 Thunderbird/107.0
Subject: Re: [PATCH v2] tests: Add sndio to the FreeBSD CI containers / VM
To: Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org
References: <Yz/TeblRI77AIHJe@humpty.home.comstyle.com>
 <0c946fe0-930e-7cc9-0f72-b16f3b2587e3@redhat.com>
Content-Language: en-US
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <0c946fe0-930e-7cc9-0f72-b16f3b2587e3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/2022 10:36 AM, Thomas Huth wrote:
> On 07/10/2022 09.21, Brad Smith wrote:
>> tests: Add sndio to the FreeBSD CI containers / VM
>>
>> ---
>
> Patch description is missing "Signed-off-by" line ... to follow our 
> QEMU development process, could you please reply with such a line to 
> this mail? Thanks!

Sorry about that. Sent over.

