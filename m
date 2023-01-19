Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840866736A9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:23:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISzf-0000cx-Ar; Thu, 19 Jan 2023 06:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISzc-0000ci-ET
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:22:04 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISza-0002TC-MU
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:22:04 -0500
Received: by mail-wr1-x435.google.com with SMTP id d2so1511442wrp.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lvHB3amIyqFavF2V06QolTQaOkBL98jdWlBgTkPvZQc=;
 b=F12yKTLDAD7OOi2PBbzpr+crBE2jkbeKc6fK657Kzdw9k/7Z6/7U5RrPuDO1nQ2YoS
 6YBx4wcQEJ9ijSeKDSScCBzTWel1WEnDJ3l2JuY3GcN5M1ra13vViaGRKgJtcnh8l3/V
 0NUc4A3iN0iszhW44lPpSNls/wflxuIs3Z4Or9ohQ8VCMbmR+KyQCRQyUMbP06FC8Egd
 l00WhcNm9q0iOtWoQVnykkqMQsxi3isEn2CEzVRtlV2/Sy33iO9hyE2Kxw9d40oC539r
 lMkfVeV5+GwtS53tzX+6qaOIvEAP4gGFhX9wCATIatp0e7UmVJ2A10roWgmKYD1zZMS8
 SNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lvHB3amIyqFavF2V06QolTQaOkBL98jdWlBgTkPvZQc=;
 b=TfLYVpREdvWVVd1c9UPk+y5nK+eLq+SBQO3MwTEUBARCJGeYMkBycQBV15yRxboDWs
 VkmNS9p8lY9RhOeMcJowD7oiBG2wJuI8OWadLXtvahX73oyD+O9FqIXDvVFpGN09wjHw
 rhSNZ1JbXLEGTDCT+PpKd7UN9NMMm+eTJ5fPqiMAK5dJ2T/jLK9tQ4L4NpNpVxm2a5on
 JzWtkPLn5XMASISIHbrwVqCklhCJh5WAxtX7HIs8NxHuyd+NbQH9UP0uP13FxS0s9rHV
 cz1EKFr9gp7bXiEPu0ut2B8EddBqcAWiwJknnlGm+KtSfVmxK7bnFNdQGpz9I7N1NWbF
 Di8A==
X-Gm-Message-State: AFqh2kpKqyC75Xi5uT8TItaB+NU/dfZmVhUgslg2skXOV7N3W3olWKg3
 9SmAsOwbW4oLkzNj4KEE4RSBYA==
X-Google-Smtp-Source: AMrXdXsvez4cm++L1RhuytpTxIcl9IpizpXhbgsBVqAFqfAJbUK5k2i0NnkOsa8nxfV6o1+QwR/hvQ==
X-Received: by 2002:a05:6000:784:b0:2be:3ccd:7f2f with SMTP id
 bu4-20020a056000078400b002be3ccd7f2fmr2127003wrb.46.1674127320609; 
 Thu, 19 Jan 2023 03:22:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r10-20020adfda4a000000b0029a06f11022sm33653243wrl.112.2023.01.19.03.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:22:00 -0800 (PST)
Message-ID: <7a46cdc2-42b7-a71d-5c00-a7b6e30d2622@linaro.org>
Date: Thu, 19 Jan 2023 12:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: tests/qtest: Is vnc-display-test supposed to work on Darwin?
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
 <CAJ+F1CLS3JxJ6yO6uTajdkia0t4gEWzSfhXnUQ+M6iywWWuUug@mail.gmail.com>
 <60569516-bd5a-b124-e105-8a9ab9f43c89@linaro.org>
 <Y8kmlVU5NKaR7i4D@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8kmlVU5NKaR7i4D@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19/1/23 12:16, Daniel P. Berrangé wrote:
> On Thu, Jan 19, 2023 at 12:01:18PM +0100, Philippe Mathieu-Daudé wrote:
>> On 5/12/22 08:51, Marc-André Lureau wrote:
>>> On Fri, Dec 2, 2022 at 1:51 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> The vnc-display-test is failing on Darwin:
>>>>
>>>> tests/qtest/vnc-display-test:45038): ERROR **: 10:42:35.488: vnc-error:
>>>> Unsupported auth type 17973672
>>>
>>> It is supposed to pass. Can you share more details? It doesn't look
>>> like an endianness issue, at first sight..
>>
>> Adding '-trace vnc*' and setting _VNC_DEBUG in "vnc.h" I get:

>> Bail out! FATAL-ERROR: vnc-error: Unsupported auth type 5489072
> 
> ^^^^ This specific message is comnig from the gtk-vnc client rather
> than QEMU
> 
> Still doesn't tell us if the flaw is server or client side. The
> logs from QEMU are insufficient. In theory it should be reporting
> auth type == 0 though, for 'no auth' configs.

>> Does that help? What else can I do to gather more info?
> 
> Modify vnc-display-test.c to call  vnc_util_set_debug(TRUE);
> before vnc_connection_new(), to get the gtk-vnc debug logs
> to stderr too.
Here you go:

vnc_server_dpy_recreate VNC server dpy recreate dpy=0x1588b8000 
size=640x384 fmt=537004168
vnc_auth_init VNC auth init state=0x1588b8000 websock=0 auth=1 subauth=0
vnc_auth_init VNC auth init state=0x1588b8000 websock=1 auth=1 subauth=0
vnc_client_connect VNC client connect state=0x1484b0000 ioc=0x152e667f0
# gtk-vnc-DEBUG: ../src/vncconnection.c Init VncConnection=0x14f0168b0
gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Init 
VncConnection=0x14f0168b0
# gtk-vnc-DEBUG: ../src/vncconnection.c Thinking about auth type 1
gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Thinking about auth 
type 1
# gtk-vnc-DEBUG: ../src/vncconnection.c Decided on auth type 1
gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Decided on auth type 1
# gtk-vnc-DEBUG: ../src/vncconnection.c Open fd=4
gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Open fd=4
# gtk-vnc-DEBUG: ../src/vncconnection.c Open coroutine starting
gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Open coroutine starting
# gtk-vnc-DEBUG: ../src/vncconnection.c Started background coroutine
gtk-vnc-DEBUG: 12:20:30.484: ../src/vncconnection.c Started background 
coroutine
# gtk-vnc-DEBUG: ../src/vncconnection.c Connecting to FD 4
gtk-vnc-DEBUG: 12:20:30.484: ../src/vncconnection.c Connecting to FD 4
# gtk-vnc-DEBUG: ../src/vncconnection.c Emit main context 16
gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Emit main context 16
# gtk-vnc-DEBUG: ../src/vncconnection.c Protocol initialization
gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Protocol initialization
# gtk-vnc-DEBUG: ../src/vncconnection.c Schedule greeting timeout 
0x14f0155e0
gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Schedule greeting 
timeout 0x14f0155e0
# gtk-vnc-DEBUG: ../src/vncconnection.c Remove timeout 0x14f0155e0
gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Remove timeout 
0x14f0155e0
# gtk-vnc-DEBUG: ../src/vncconnection.c Server version: 3.8
gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Server version: 3.8
# gtk-vnc-DEBUG: ../src/vncconnection.c Sending full greeting
gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Sending full greeting
# gtk-vnc-DEBUG: ../src/vncconnection.c Using version: 3.8
gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Using version: 3.8
# gtk-vnc-DEBUG: ../src/vncconnection.c Possible auth 1
gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Possible auth 1
# gtk-vnc-DEBUG: ../src/vncconnection.c Emit main context 14
gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Emit main context 14
# gtk-vnc-DEBUG: ../src/vncconnection.c Waiting for auth type
gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Waiting for auth type
# gtk-vnc-DEBUG: ../src/vncconnection.c Choose auth 10486192
gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Choose auth 10486192
# gtk-vnc-DEBUG: ../src/vncconnection.c Checking if credentials are needed
gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Checking if 
credentials are needed
# gtk-vnc-DEBUG: ../src/vncconnection.c No credentials required
gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c No credentials required
# gtk-vnc-DEBUG: ../src/vncconnection.c Emit main context 12
gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Emit main context 12
# gtk-vnc-DEBUG: ../src/vncconnection.c Error: Unsupported auth type 
10486192
gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Error: Unsupported 
auth type 10486192
# gtk-vnc-DEBUG: ../src/vncconnection.c Emit main context 19
gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Emit main context 19
Bail out! FATAL-ERROR: vnc-error: Unsupported auth type 10486192

** ERROR **: 12:20:30.589: vnc-error: Unsupported auth type 10486192
vnc_auth_reject VNC client auth rejected state=0x1484b0000 method 
expected=1 got=176
vnc_client_disconnect_start VNC client disconnect start 
state=0x1484b0000 ioc=0x152e667f0
vnc_client_disconnect_finish VNC client disconnect finish 
state=0x1484b0000 ioc=0x152e667f0
Trace/BPT trap: 5


