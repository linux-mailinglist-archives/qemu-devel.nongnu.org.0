Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3B4677F86
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 16:22:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJyde-0008Td-Jc; Mon, 23 Jan 2023 10:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJyda-0008Sn-JA
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:21:34 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJydY-0000vY-PB
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:21:34 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d14so7459795wrr.9
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1PYMelAbiI4GIah2YOLL+y2cvxtnbXe0JpzsrPzkIfA=;
 b=ncMybC7xTqoEiTkrv2tMZxOdgNtHFufdev0oHuGFTPOGxMrSIPuvf9zK6M/bqz0Wzd
 Ovj1Vaxm3fcsrW/ZDvDd1oPQ0YpPshUxMNz8tNO6z5aoXs2jzsmulUyaRLG1BAYGVPTK
 t7xEQAMnO5dMjGdnTAnlFIy3DQ0IHkpj8N4VCbAzWcjuSOfsE/XUEzWCLpFrDuc1xLBu
 rAx/0j1nYTwMuguPQv09sKv8oCVkOS1KreUSlT8sH0s/9pmD4RJWBurWVyPjO4sfI0g3
 VMbB618MQetdoY9Mhf9hwfj93OPTpy4FqWgkXgRgu+Zp7aYxt1e+GMnvHdGQUwEHrfsI
 ZoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1PYMelAbiI4GIah2YOLL+y2cvxtnbXe0JpzsrPzkIfA=;
 b=goDm9nNCNH8qjql2EsGVefEqXTKuVMz2TFVVA2OT9N/aWL9/CN7G4PXuwCyLJks2I5
 FgB746tDY9s4Y0LwzFXYt2eqfelc3CEBJDkFhNjAqlE6zg3iaJYA8MXowIqYaVBfo5a4
 prq9+/tb87kx2iO7lwyDRE1M9IYnf7d3tiam0q+AeYnYBqd9WpZGmgyxvWGwuPsdFBHk
 5votPgYIHQOYga6h/xHrUr9O84RThxZTgljYnxQoyyamUFC7iSy7zfLFM2Lv3cfabhOD
 ghNjr6yIqr2MCb646tNXY3mTB9syWU43XDbtVgEixYeDxFUPeWbO+hLyO9WoxiUKFxTO
 BzMQ==
X-Gm-Message-State: AFqh2ko37aR+4j06Ra5SBTUZtD05W3JTgJPJqRRqlLmC0jDbxRkLzeCL
 9MSkGP2phrmFzirgWc9OUuWSKg==
X-Google-Smtp-Source: AMrXdXvaWt/R2W+HixvGENl4f8yqrjVUVkkaV24sKJ+IN03Aes68mquSeMkl7PqyyrmTPtNqCZgAEg==
X-Received: by 2002:a05:6000:1f81:b0:2b5:dc24:e08e with SMTP id
 bw1-20020a0560001f8100b002b5dc24e08emr20768975wrb.69.1674487290204; 
 Mon, 23 Jan 2023 07:21:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w10-20020adfde8a000000b002be34f87a34sm11990880wrl.1.2023.01.23.07.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 07:21:29 -0800 (PST)
Message-ID: <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
Date: Mon, 23 Jan 2023 16:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
 <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
 <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 23/1/23 15:43, Evgeny Iakovlev wrote:
> 
> On 1/23/2023 09:14, Philippe Mathieu-Daudé wrote:
>> On 20/1/23 16:54, Evgeny Iakovlev wrote:
>>> UART should be enabled in general and have RX enabled specifically to be
>>> able to receive data from peripheral device. Same goes for transmitting
>>> data to peripheral device and a TXE flag.
>>>
>>> Check if UART CR register has EN and RXE or TXE bits enabled before
>>> trying to receive or transmit data.
>>>
>>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>   hw/char/pl011.c | 22 +++++++++++++++++++---
>>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>>> +static inline bool pl011_can_transmit(PL011State *s)
>>> +{
>>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>>> +}
>>> +
>>>   static void pl011_write(void *opaque, hwaddr offset,
>>>                           uint64_t value, unsigned size)
>>>   {
>>> @@ -221,7 +231,9 @@ static void pl011_write(void *opaque, hwaddr offset,
>>>         switch (offset >> 2) {
>>>       case 0: /* UARTDR */
>>> -        /* ??? Check if transmitter is enabled.  */
>>> +        if (!pl011_can_transmit(s)) {
>>> +            break;
>>> +        }
>>>           ch = value;
>>>           /* XXX this blocks entire thread. Rewrite to use
>>>            * qemu_chr_fe_write and background I/O callbacks */
>>> @@ -292,7 +304,11 @@ static int pl011_can_receive(void *opaque)
>>>       PL011State *s = (PL011State *)opaque;
>>>       int r;
>>>   -    r = s->read_count < pl011_get_fifo_depth(s);
>>> +    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>>
>> Maybe add pl011_can_receive() similarly to pl011_can_transmit().
>>
>> Otherwise:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 
> Thanks! There's already a pl011_can_receive though, its the 
> pl011_can_transmit that's new :)

pl011_can_receive() returns the number of bytes that pl011_receive() can 
accept, pl011_can_transmit() returns a boolean.

I was thinking of:

-- >8 --
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index dd20b76609..ea5769a31c 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -221,6 +221,11 @@ static inline bool pl011_can_transmit(PL011State *s)
      return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
  }

+static inline bool pl011_can_receive(PL011State *s)
+{
+    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_RXE;
+}
+
  static void pl011_write(void *opaque, hwaddr offset,
                          uint64_t value, unsigned size)
  {
@@ -299,12 +304,12 @@ static void pl011_write(void *opaque, hwaddr offset,
      }
  }

-static int pl011_can_receive(void *opaque)
+static int pl011_receivable_bytes(void *opaque)
  {
      PL011State *s = (PL011State *)opaque;
      int r;

-    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
+    if (!pl011_can_receive(s)) {
          r = 0;
      } else {
          r = s->read_count < pl011_get_fifo_depth(s);
@@ -459,7 +464,7 @@ static void pl011_realize(DeviceState *dev, Error 
**errp)
  {
      PL011State *s = PL011(dev);

-    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
+    qemu_chr_fe_set_handlers(&s->chr, pl011_receivable_bytes, 
pl011_receive,
                               pl011_event, NULL, s, NULL, true);
  }

---

with maybe a better name for pl011_receivable_bytes().



