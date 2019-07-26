Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3076199
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 11:13:02 +0200 (CEST)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqwHc-00017D-CK
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 05:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35645)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hqwHI-0000c0-2n
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hqwHA-0000DE-Tt
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:12:35 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:52306)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hqwH4-000848-A1; Fri, 26 Jul 2019 05:12:26 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 1212A96F52;
 Fri, 26 Jul 2019 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564132339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1772vBXvapvSD5tbTLGT/zlBP9h+P1My+8HFMiZbZU=;
 b=4h9Y2gCfVxerZjhL7dIqFOv7QT5SI9PURUVWgehWMre0D55B8DP9BprIivQ/iF73OKwsrO
 myQvoeqPx7DDigv5jm0Y0TIh/hEPUgF8MkpV78K44wcsOSfOSVTY3sljsPHuHfgmaUzs0V
 nB3n8+fi5lwHoGU5+YxpGRqB6yxpZL4=
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-3-peter.maydell@linaro.org>
 <20190725172712.GM2656@work-vm>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <fa5590b1-2d62-a9c4-c54e-957c9bac9ed1@greensocs.com>
Date: Fri, 26 Jul 2019 11:12:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190725172712.GM2656@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564132341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1772vBXvapvSD5tbTLGT/zlBP9h+P1My+8HFMiZbZU=;
 b=x5W7Ttm4B9zzWvUWtw3E+2EkJqSl7j9wk3QRp0wET0+xpMaZUDTMojbk22B7rjbfHEoebj
 s8fQ0PWga3j/Jqkt6ErP8FD6nZMK1vKG84yP7rmNI7MTm8w2+FdWyZ/Bwtv8WOU0yygMLM
 RYhVJxoNW8oFYI0HmI67swWZ0u/Cdp4=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564132341; a=rsa-sha256; cv=none;
 b=4skvJs4Hvt2V0mLTB2pAitZPom/JUS7YzOC74fxYnGfh5wNK+pJR7eunjoWcuWOmseMZ/h
 GuK8Zj/QH6sWxpJ3z2MXxvtDNGQ2+Lreh/BDzUr0FRLzSagmFywdyFOOXJOYiLlinHfMCi
 3ipAvasPQ0PRr8AgbTepiE8OtmvF2qc=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-devel] [PATCH for-4.1? 2/2] vmstate.h: Type check
 VMSTATE_STRUCT_VARRAY macros
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/25/19 7:27 PM, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> The VMSTATE_STRUCT_VARRAY_UINT32 macro is intended to handle
>> migrating a field which is an array of structs, but where instead of
>> migrating the entire array we only migrate a variable number of
>> elements of it.
>>
>> The VMSTATE_STRUCT_VARRAY_POINTER_UINT32 macro is intended to handle
>> migrating a field which is of pointer type, and points to a
>> dynamically allocated array of structs of variable size.
>>
>> We weren't actually checking that the field passed to
>> VMSTATE_STRUCT_VARRAY_UINT32 really is an array, with the result that
>> accidentally using it where the _POINTER_ macro was intended would
>> compile but silently corrupt memory on migration.
>>
>> Add type-checking that enforces that the field passed in is
>> really of the right array type. This applies to all the VMSTATE
>> macros which use flags including VMS_VARRAY_* but not VMS_POINTER.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> However, for the rest of it, from migration I'm happy:
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Tested-by: Damien Hedde <damien.hedde@greensocs.com>

Damien

