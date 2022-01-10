Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0424489C2D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:29:03 +0100 (CET)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wbW-00033H-IX
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:29:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6wSz-00037K-IC
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:20:13 -0500
Received: from mail.xen0n.name ([115.28.160.31]:43994
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6wSv-0006yp-Td
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:20:13 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E01BC600FB;
 Mon, 10 Jan 2022 23:20:03 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641828004; bh=DaFNDYB9z2o8lRkUwDwEptDc4eiEPyk3wwsE9hFkHzg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sTdmTENzbcGtMV8hh7HhoGup42egwC60PAux+UZ/Z+l0MhZK07MRSBpbr7F/UYZRK
 yCbmG3TJZVUXZmHc/P7oeUekZjOYgU6T7FfmygdTrNY/ZuNPAU1AdptPc5nPYZ+4ZX
 JhkUHFI2Lc9L8c3cyxIRCO4XbRl605ouj8laZqI0=
Content-Type: multipart/alternative;
 boundary="------------G0fdyQnadOfPtl0yEAI31c1s"
Message-ID: <0c5cb936-8a02-99e1-8bf3-26e281dcbfca@xen0n.name>
Date: Mon, 10 Jan 2022 23:20:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
Subject: Re: [PATCH v14 02/26] target/loongarch: Add core definition
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-3-gaosong@loongson.cn>
 <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
 <be8f315d-7a98-92f0-87cc-c69983c77234@linaro.org>
 <f69f156e-f8d9-a902-341b-12306e55f539@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <f69f156e-f8d9-a902-341b-12306e55f539@loongson.cn>
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------G0fdyQnadOfPtl0yEAI31c1s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 1/10/22 20:34, gaosong wrote:
>
> Hi,
>
> On 2022/1/10 上午2:49, Richard Henderson wrote:
>>>> +static bool loongarch_cpu_has_work(CPUState *cs)
>>>> +{
>>>> +    return true;
>>>
>>> Note: this is only applicable to CONFIG_USER_ONLY, and needs to be 
>>> changed in the following commits adding system emulation. To better 
>>> convey your intention it may be better to use an #ifdef guard, 
>>> something like this:
>>>
>>> #ifndef CONFIG_USER_ONLY
>>> #error System emulation TODO
>>> #else
>>>      return true;
>>> #endif
>>>
>>> (I'm not sure if this is okay in QEMU coding style, so please 
>>> correct me if this isn't the case.)
>>
> In my opinion, we don't need to do this. As you pointed out below, SPW shouldn't appear in this series. All CONFIG_USER_ONLY  macors should appear in the system emulation series.

IMO, preemptively including the guard serves as "paving the road" to the 
full system emulation; in your argument, I feel we're deferring too much 
information to the context (this patch being inside the "linux-user" 
series, and getting merged earlier than full system emulation), while 
context would gradually fade out in the months/years ahead; being 
precise in writing down what you mean doesn't do any harm.

Additionally, we might have to re-order the patches in order to unblock 
as much progress as possible, and in that case, this patch and the other 
patch adding the !CONFIG_USER_ONLY part would probably get squashed into 
one, so this code has to be touched too.

--------------G0fdyQnadOfPtl0yEAI31c1s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 1/10/22 20:34, gaosong wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f69f156e-f8d9-a902-341b-12306e55f539@loongson.cn">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Hi,<br>
      </p>
      <div class="moz-cite-prefix">On 2022/1/10 上午2:49, Richard
        Henderson wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:be8f315d-7a98-92f0-87cc-c69983c77234@linaro.org">
        <blockquote type="cite" style="color: #000000;">
          <blockquote type="cite" style="color: #000000;">+static bool
            loongarch_cpu_has_work(CPUState *cs) <br>
            +{ <br>
            +    return true; <br>
          </blockquote>
          <br>
          Note: this is only applicable to CONFIG_USER_ONLY, and needs
          to be changed in the following commits adding system
          emulation. To better convey your intention it may be better to
          use an #ifdef guard, something like this: <br>
          <br>
          #ifndef CONFIG_USER_ONLY <br>
          #error System emulation TODO <br>
          #else <br>
               return true; <br>
          #endif <br>
          <br>
          (I'm not sure if this is okay in QEMU coding style, so please
          correct me if this isn't the case.) <br>
        </blockquote>
        <br>
      </blockquote>
      <pre>In my opinion, we don't need to do this. As you pointed out below, SPW shouldn't appear in this series. All CONFIG_USER_ONLY  macors should appear in the system emulation series.</pre>
    </blockquote>
    <p>IMO, preemptively including the guard serves as "paving the road"
      to the full system emulation; in your argument, I feel we're
      deferring too much information to the context (this patch being
      inside the "linux-user" series, and getting merged earlier than
      full system emulation), while context would gradually fade out in
      the months/years ahead; being precise in writing down what you
      mean doesn't do any harm.</p>
    <p>Additionally, we might have to re-order the patches in order to
      unblock as much progress as possible, and in that case, this patch
      and the other patch adding the !CONFIG_USER_ONLY part would
      probably get squashed into one, so this code has to be touched
      too.<br>
    </p>
  </body>
</html>

--------------G0fdyQnadOfPtl0yEAI31c1s--

