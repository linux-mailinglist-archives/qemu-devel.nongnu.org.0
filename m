Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCD632A28B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:47:52 +0100 (CET)
Received: from localhost ([::1]:53084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6JT-0000y9-DP
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH6I4-00007j-Dm
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:46:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:56594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH6I0-0003fD-AG
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:46:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5837AC54
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 14:46:08 +0000 (UTC)
Subject: Re: [PATCH 0/2] semihosting: Move it out of hw/
To: qemu-devel@nongnu.org
References: <20210226131356.3964782-1-f4bug@amsat.org>
 <463befd2-c384-553b-9a78-bb033d92638e@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0cec0b74-cac0-d35d-eaaa-3ce96507a922@suse.de>
Date: Tue, 2 Mar 2021 15:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <463befd2-c384-553b-9a78-bb033d92638e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 3/2/21 3:10 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing Claudio.
> 
> On 2/26/21 2:13 PM, Philippe Mathieu-Daudé wrote:
>> In order to reduce CONFIG_USER_ONLY uses in hw/, move
>> semihosting out of it, being a generic feature.

I have nothing against it, just what does this buy us?

Maybe I am just missing the point..

Ciao,

Claudio

>>
>> Philippe Mathieu-Daudé (2):
>>   semihosting: Move include/hw/semihosting/ -> include/semihosting/
>>   semihosting: Move hw/semihosting/ -> semihosting/
>>
>>  meson.build                                       | 1 +
>>  include/{hw => }/semihosting/console.h            | 0
>>  include/{hw => }/semihosting/semihost.h           | 0
>>  {hw/semihosting => semihosting}/common-semi.h     | 0
>>  gdbstub.c                                         | 2 +-
>>  hw/mips/malta.c                                   | 2 +-
>>  linux-user/aarch64/cpu_loop.c                     | 2 +-
>>  linux-user/arm/cpu_loop.c                         | 2 +-
>>  linux-user/riscv/cpu_loop.c                       | 2 +-
>>  linux-user/semihost.c                             | 2 +-
>>  {hw/semihosting => semihosting}/arm-compat-semi.c | 6 +++---
>>  {hw/semihosting => semihosting}/config.c          | 2 +-
>>  {hw/semihosting => semihosting}/console.c         | 4 ++--
>>  softmmu/vl.c                                      | 2 +-
>>  stubs/semihost.c                                  | 2 +-
>>  target/arm/helper.c                               | 4 ++--
>>  target/arm/m_helper.c                             | 4 ++--
>>  target/arm/translate-a64.c                        | 2 +-
>>  target/arm/translate.c                            | 2 +-
>>  target/lm32/helper.c                              | 2 +-
>>  target/m68k/op_helper.c                           | 2 +-
>>  target/mips/cpu.c                                 | 2 +-
>>  target/mips/mips-semi.c                           | 4 ++--
>>  target/mips/translate.c                           | 2 +-
>>  target/nios2/helper.c                             | 2 +-
>>  target/riscv/cpu_helper.c                         | 2 +-
>>  target/unicore32/helper.c                         | 2 +-
>>  target/xtensa/translate.c                         | 2 +-
>>  target/xtensa/xtensa-semi.c                       | 2 +-
>>  Kconfig                                           | 1 +
>>  MAINTAINERS                                       | 4 ++--
>>  hw/Kconfig                                        | 1 -
>>  hw/meson.build                                    | 1 -
>>  {hw/semihosting => semihosting}/Kconfig           | 0
>>  {hw/semihosting => semihosting}/meson.build       | 0
>>  35 files changed, 35 insertions(+), 35 deletions(-)
>>  rename include/{hw => }/semihosting/console.h (100%)
>>  rename include/{hw => }/semihosting/semihost.h (100%)
>>  rename {hw/semihosting => semihosting}/common-semi.h (100%)
>>  rename {hw/semihosting => semihosting}/arm-compat-semi.c (99%)
>>  rename {hw/semihosting => semihosting}/config.c (99%)
>>  rename {hw/semihosting => semihosting}/console.c (98%)
>>  rename {hw/semihosting => semihosting}/Kconfig (100%)
>>  rename {hw/semihosting => semihosting}/meson.build (100%)
>>
> 
> 


