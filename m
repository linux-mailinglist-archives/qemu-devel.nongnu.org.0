Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4AE1A1940
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 02:30:45 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLyc7-0005sU-NL
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 20:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1jLyau-0005A1-Kn
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 20:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1jLyas-0000HR-MS
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 20:29:27 -0400
Received: from mga06.intel.com ([134.134.136.31]:1702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1jLyas-0000Cy-DD
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 20:29:26 -0400
IronPort-SDR: SwB4JsStvTAN+bnzX1NtNir6mF427n5lJN4dIQz58Rri9vLbfxH6xrs+Ux50FLPRwhAQLexoz6
 4IX1wsv10CgQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 17:29:16 -0700
IronPort-SDR: vt6PAvqYUHmG6RblNGVJHxeJzjuzhxGUDksZT+BSD4wd6d4vlxHJTj/M3eABRE9afGyDezJntX
 yiq3eyLySkXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; d="scan'208";a="286386917"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.238.4.86])
 ([10.238.4.86])
 by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2020 17:29:14 -0700
Subject: Re: [PATCH v4] target/i386: Add notes for versioned CPU models
To: "ehabkost@redhat.com" <ehabkost@redhat.com>
References: <20200324051034.30541-1-tao3.xu@intel.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <86f75c9e-a29f-dbae-1414-5fd06f981fed@intel.com>
Date: Wed, 8 Apr 2020 08:29:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324051034.30541-1-tao3.xu@intel.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.31
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for comments

On 3/24/2020 1:10 PM, Xu, Tao3 wrote:
> Add which features are added or removed in this version.
> 
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
> 
> The output is as follows:
> qemu-system-x86_64 -cpu help | grep "\["
> x86 Cascadelake-Server-v2  Intel Xeon Processor (Cascadelake) [ARCH_CAPABILITIES]
> x86 Cascadelake-Server-v3  Intel Xeon Processor (Cascadelake) [ARCH_CAPABILITIES, no TSX]
> x86 Denverton-v2          Intel Atom Processor (Denverton) [no MPX, no MONITOR]
> x86 Icelake-Client-v2     Intel Core Processor (Icelake) [no TSX]
> x86 Icelake-Server-v2     Intel Xeon Processor (Icelake) [no TSX]
> 
> Changes in v3:
>      - Keep the existing custom model-id (Eduardo)
> 
> Changes in v2:
>      - correct the note of Cascadelake v3 (Xiaoyao)
> ---
>   target/i386/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 34b511f078..1c7690baa0 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -3192,6 +3192,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
>           .versions = (X86CPUVersionDefinition[]) {
>               { .version = 1 },
>               { .version = 2,
> +              .note = "ARCH_CAPABILITIES",
>                 .props = (PropValue[]) {
>                     { "arch-capabilities", "on" },
>                     { "rdctl-no", "on" },
> @@ -3203,6 +3204,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
>               },
>               { .version = 3,
>                 .alias = "Cascadelake-Server-noTSX",
> +              .note = "ARCH_CAPABILITIES, no TSX",
>                 .props = (PropValue[]) {
>                     { "hle", "off" },
>                     { "rtm", "off" },
> @@ -3424,6 +3426,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
>               { .version = 1 },
>               {
>                   .version = 2,
> +                .note = "no TSX",
>                   .alias = "Icelake-Client-noTSX",
>                   .props = (PropValue[]) {
>                       { "hle", "off" },
> @@ -3541,6 +3544,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
>               { .version = 1 },
>               {
>                   .version = 2,
> +                .note = "no TSX",
>                   .alias = "Icelake-Server-noTSX",
>                   .props = (PropValue[]) {
>                       { "hle", "off" },
> @@ -3648,6 +3652,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
>               { .version = 1 },
>               {
>                   .version = 2,
> +                .note = "no MPX, no MONITOR",
>                   .props = (PropValue[]) {
>                       { "monitor", "off" },
>                       { "mpx", "off" },
> 

