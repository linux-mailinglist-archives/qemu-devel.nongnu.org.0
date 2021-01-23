Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3E30153A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 13:39:52 +0100 (CET)
Received: from localhost ([::1]:57988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3ICl-0000iI-T3
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 07:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l3I2p-00028W-Da
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 07:29:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:32840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l3I2m-0000ow-Jb
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 07:29:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25748AD17;
 Sat, 23 Jan 2021 12:29:31 +0000 (UTC)
Subject: Re: [PATCH v2 06/12] meson: Merge trace_events_subdirs array
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-7-philmd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <dc634a3a-3b35-2855-ee85-7427b7917fbf@suse.de>
Date: Sat, 23 Jan 2021 13:29:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210122204441.2145197-7-philmd@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 9:44 PM, Philippe Mathieu-Daudé wrote:
> The trace_events_subdirs array is split in two different
> locations, merge it as one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  meson.build | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 181f8795f5a..c43538a1523 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1686,7 +1686,20 @@
>    'accel/kvm',
>    'accel/tcg',
>    'crypto',
> +  'hw/core',
> +  'qapi',
> +  'qom',
>    'monitor',
> +  'target/arm',
> +  'target/hppa',
> +  'target/i386',
> +  'target/i386/kvm',
> +  'target/mips',
> +  'target/ppc',
> +  'target/riscv',
> +  'target/s390x',
> +  'target/sparc',
> +  'util',
>  ]
>  if have_user
>    trace_events_subdirs += [ 'linux-user' ]
> @@ -1759,21 +1772,6 @@
>      'ui',
>    ]
>  endif
> -trace_events_subdirs += [
> -  'hw/core',
> -  'qapi',
> -  'qom',
> -  'target/arm',
> -  'target/hppa',
> -  'target/i386',
> -  'target/i386/kvm',
> -  'target/mips',
> -  'target/ppc',
> -  'target/riscv',
> -  'target/s390x',
> -  'target/sparc',
> -  'util',
> -]
>  
>  vhost_user = not_found
>  if 'CONFIG_VHOST_USER' in config_host
> 

Reviewed-by: Claudio Fontana <cfontana@suse.de>

