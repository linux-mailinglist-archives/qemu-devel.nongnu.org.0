Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E097B2D8556
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 10:27:07 +0100 (CET)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko1BC-0002YD-V9
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 04:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ko18o-0001N4-RQ
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 04:24:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:44944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ko18m-0004lk-4K
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 04:24:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B209AEBE;
 Sat, 12 Dec 2020 09:24:34 +0000 (UTC)
Subject: Re: [PATCH v11 05/25] i386: move whpx accel files into whpx/
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-6-cfontana@suse.de>
 <20201211204109.GF1289986@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1e47cd3a-ddf9-4c7e-edb3-2afdd37e52fa@suse.de>
Date: Sat, 12 Dec 2020 10:24:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201211204109.GF1289986@habkost.net>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 9:41 PM, Eduardo Habkost wrote:
> On Fri, Dec 11, 2020 at 09:31:23AM +0100, Claudio Fontana wrote:
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  target/i386/{ => whpx}/whp-dispatch.h | 0
>>  target/i386/{ => whpx}/whpx-cpus.h    | 0
>>  target/i386/{ => whpx}/whpx-all.c     | 0
>>  target/i386/{ => whpx}/whpx-cpus.c    | 0
>>  MAINTAINERS                           | 5 +----
>>  target/i386/meson.build               | 5 +----
>>  target/i386/whpx/meson.build          | 4 ++++
>>  7 files changed, 6 insertions(+), 8 deletions(-)
>>  rename target/i386/{ => whpx}/whp-dispatch.h (100%)
>>  rename target/i386/{ => whpx}/whpx-cpus.h (100%)
>>  rename target/i386/{ => whpx}/whpx-all.c (100%)
>>  rename target/i386/{ => whpx}/whpx-cpus.c (100%)
>>  create mode 100644 target/i386/whpx/meson.build
>>
> 
> Unfortunately this conflicts with commit faf20793b5af ("WHPX:
> support for the kernel-irqchip on/off") and needs to be redone.
> 

Hi Eduardo, I saw some conflict yesterday yes, it's minor, np.

Ciao,

Claudoi

