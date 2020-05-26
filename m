Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84731A1019
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 17:22:31 +0200 (CEST)
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLq3a-0007YL-Fe
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 11:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38500)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cfontana@suse.de>) id 1jLq2n-00073B-8e
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:21:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cfontana@suse.de>) id 1jLq2m-0008LL-7W
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:21:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:53748)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cfontana@suse.de>) id 1jLq2m-0008Kj-1V
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:21:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94D8FACC2;
 Tue,  7 Apr 2020 15:21:37 +0000 (UTC)
Subject: Re: [PATCH] configure: check for bison, flex before dtc submodule
 build
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200407111618.17241-1-cfontana@suse.de>
 <CAFEAcA9SYT227B9K7yHcv_J==r4xZ1spUSNzL_bRXUpAjT5QVA@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <60f77462-a078-6325-6b22-2af9c281e194@suse.de>
Date: Tue, 7 Apr 2020 17:21:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9SYT227B9K7yHcv_J==r4xZ1spUSNzL_bRXUpAjT5QVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Alex Bennee <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/20 1:20 PM, Peter Maydell wrote:
> On Tue, 7 Apr 2020 at 12:16, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> if fdt is required, and the system DTC (libfdt) is not usable,
>> check for the dtc submodule requirements before trying to build it,
>> and error out with a helpful message in case the dependencies are not met.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
> Does the dtc module actually need bison/flex, or does it just
> print an ugly warning about it? We only want the 'libfdt' part
> of dtc, which doesn't need the parser, we don't need to build
> the actual dtc compiler.
> 
> thanks
> -- PMM
> 

Hi Peter,

indeed, it was just an ugly warning that I mistook for an actual error.

I'll try to see if I can get rid of the warning somehow by playing with the build system a bit,

but otherwise all green.

Thanks,

Claudio

