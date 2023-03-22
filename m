Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF26C4F53
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0GP-0000gi-Tl; Wed, 22 Mar 2023 11:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1pf0GJ-0000eJ-5m
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:20:27 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1pf0GH-0008MT-Ac
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:20:26 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4PhXGL2gQDz8PbP;
 Wed, 22 Mar 2023 11:20:10 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=NgBgxuC7b
 WFTK6r+IsIXbF9cSjk=; b=AJ7TNY99TN89BjZefPoj5sOmse1cSNW82lAcvDQ7o
 f/m7N4yxH50Nm90/wBbEvFUETXt65jyiRSiIRbWAw10idpjw1slo1iODAoQJlmWr
 v1lgG8+H21MzK10PUHqkZ27Eori9tKT11UvP+1k7SpuFhVlHmUc0u1n3p/DleoHK
 LU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=kbL
 YunAGnideXRvPO1Vt+jQt+qJOMbD8HME8t0J4h3aMfUWnSzQ4R3equ1D9lRupiMq
 bAuLWggQ0goQZHxsHKg0rG41IcNl9S78TdQHOS+2QeYJ614iI0bGWp2Icpb3Clx9
 iIXGKnlG+bbCMnzE8RlOl9rFqqLeCI+7jHEWc9hE=
Received: from [IPV6:2001:470:b050:6:cc31:46d5:f26a:a82b] (unknown
 [IPv6:2001:470:b050:6:cc31:46d5:f26a:a82b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4PhXGK6j9hz8PbN;
 Wed, 22 Mar 2023 11:20:09 -0400 (EDT)
Message-ID: <1d0081e1-1a01-037b-1317-947acf43a78d@comstyle.com>
Date: Wed, 22 Mar 2023 11:20:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] tests/vm: skip X11 in openbsd installation
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-2-berrange@redhat.com>
 <d8fe0d24-03ee-4c4a-6886-36319eaa2948@linaro.org>
 <c3c944e3-f7e6-1ec2-5a18-e694d4c9c842@redhat.com>
Content-Language: en-US
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <c3c944e3-f7e6-1ec2-5a18-e694d4c9c842@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023-03-22 9:40 a.m., Thomas Huth wrote:
> On 22/03/2023 14.38, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 22/3/23 13:36, Daniel P. Berrang=C3=A9 wrote:
>>> As a VM used only for automated testing there is no need to
>>> install the X11 stack.
>>>
>>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>> ---
>>> =C2=A0 tests/vm/openbsd | 3 +--
>>> =C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
>>> index eaeb201e91..6af7afac0d 100755
>>> --- a/tests/vm/openbsd
>>> +++ b/tests/vm/openbsd
>>> @@ -106,8 +106,7 @@ class OpenBSDVM(basevm.BaseVM):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_w=
ait("Password for root account")
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_s=
end("%s\n" % self._config["root_pass"])
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_w=
ait_send("Start sshd(8)", "yes\n")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_wait_send("X=
 Window System", "\n")
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_wait_send("x=
enodm", "\n")
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_wait_send("X=
 Window System", "no\n")
>>
>> Wasn't this useful to link a X11-ready binary, even if only testing
>> with -display=3Dnone?
>
> tests/vm/openbsd later installs sdl2 and gtk+3, so I assume that will=20
> pull in the required libraries if necessary, without all the other=20
> non-necessary stuff.


No, it will not. If you want sdl2 / gtk+3 you have to have X enabled.


