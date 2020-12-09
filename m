Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E90A2D40AE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:08:15 +0100 (CET)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxKQ-00030L-Cl
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmxHz-0001Hz-66
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:05:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:32920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmxHr-000094-Hk
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:05:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07F10AC94;
 Wed,  9 Dec 2020 11:05:34 +0000 (UTC)
Subject: Re: [RFC v9 08/32] i386: move TCG accel files into tcg/
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-9-cfontana@suse.de> <87blf3fhpu.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e159e82b-1444-2c26-eeb3-eeaba1c25489@suse.de>
Date: Wed, 9 Dec 2020 12:05:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87blf3fhpu.fsf@linaro.org>
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 10:30 AM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/i386/meson.build             | 14 +-------------
>>  target/i386/{ => tcg}/bpt_helper.c  |  0
>>  target/i386/{ => tcg}/cc_helper.c   |  0
>>  target/i386/{ => tcg}/excp_helper.c |  0
>>  target/i386/{ => tcg}/fpu_helper.c  |  0
>>  target/i386/{ => tcg}/int_helper.c  |  0
>>  target/i386/{ => tcg}/mem_helper.c  |  0
>>  target/i386/tcg/meson.build         | 13 +++++++++++++
>>  target/i386/{ => tcg}/misc_helper.c |  0
>>  target/i386/{ => tcg}/mpx_helper.c  |  0
>>  target/i386/{ => tcg}/seg_helper.c  |  0
>>  target/i386/{ => tcg}/smm_helper.c  |  0
>>  target/i386/{ => tcg}/svm_helper.c  |  0
>>  target/i386/{ => tcg}/tcg-stub.c    |  0
>>  target/i386/{ => tcg}/translate.c   |  0
>>  15 files changed, 14 insertions(+), 13 deletions(-)
>>  rename target/i386/{ => tcg}/bpt_helper.c (100%)
>>  rename target/i386/{ => tcg}/cc_helper.c (100%)
>>  rename target/i386/{ => tcg}/excp_helper.c (100%)
>>  rename target/i386/{ => tcg}/fpu_helper.c (100%)
>>  rename target/i386/{ => tcg}/int_helper.c (100%)
>>  rename target/i386/{ => tcg}/mem_helper.c (100%)
>>  create mode 100644 target/i386/tcg/meson.build
>>  rename target/i386/{ => tcg}/misc_helper.c (100%)
>>  rename target/i386/{ => tcg}/mpx_helper.c (100%)
>>  rename target/i386/{ => tcg}/seg_helper.c (100%)
>>  rename target/i386/{ => tcg}/smm_helper.c (100%)
>>  rename target/i386/{ => tcg}/svm_helper.c (100%)
>>  rename target/i386/{ => tcg}/tcg-stub.c (100%)
>>  rename target/i386/{ => tcg}/translate.c (100%)
> 
> I noticed target/i386/helper-tcg.h is still in the main directory. It

This is something to fix in 

i386: move TCG cpu class initialization out of helper.c

will do, thanks!


> maybe be a straggler that is harder to separate - if so might be worth
> mentioning in the commit message. Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 


