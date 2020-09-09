Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C23262F50
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 15:48:10 +0200 (CEST)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG0SH-0002eU-Oz
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 09:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kG0P0-0008PP-Sm
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 09:44:46 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23822
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kG0Oz-0007G7-7A
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 09:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599659084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXq88EFYHPWwktqeloxHeM2oJH7DAms8faWl/nd2j7I=;
 b=bkLDHWsMkiyRMJ7CqRRzH9MDATRBkyQ8KhNK6mFMaD/nJ1SKLgrvF6GpaTe0MPvarUgWIQ
 BrT9/vlD2t95QhLtLKNpozPvi/dO/hvlD6QhIwCqV49+My7FdYRWjYXOP0+5I7SdMeI/r7
 jket/lWAa6fWTENkH1r9sizZl4Mqu50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-PNuaGcFQPnCRq9GbgAIuGQ-1; Wed, 09 Sep 2020 09:44:41 -0400
X-MC-Unique: PNuaGcFQPnCRq9GbgAIuGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0042418BA29B;
 Wed,  9 Sep 2020 13:44:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 151DD7E72A;
 Wed,  9 Sep 2020 13:44:37 +0000 (UTC)
Subject: Re: [PATCH v2 01/10] CODING_STYLE.rst: flesh out our naming
 conventions.
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200909112742.25730-1-alex.bennee@linaro.org>
 <20200909112742.25730-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d8fdf68b-5f03-2cd4-5d9c-3a4c9c760a96@redhat.com>
Date: Wed, 9 Sep 2020 15:44:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200909112742.25730-2-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 02:43:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, richard.henderson@linaro.org,
 f4bug@amsat.org, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/09/2020 13.27, Alex Bennée wrote:
> Mention a few of the more common naming conventions we follow in the
> code base including common variable names and function prefix and
> suffix examples.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20200903112107.27367-2-alex.bennee@linaro.org>
> 
> ---
> v4
>   - Incorporated Paolo's suggested paragraph
> ---
>  CODING_STYLE.rst | 37 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/CODING_STYLE.rst b/CODING_STYLE.rst
> index 427699e0e42..8b13ef0669e 100644
> --- a/CODING_STYLE.rst
> +++ b/CODING_STYLE.rst
> @@ -109,8 +109,41 @@ names are lower_case_with_underscores_ending_with_a_t, like the POSIX
>  uint64_t and family.  Note that this last convention contradicts POSIX
>  and is therefore likely to be changed.
>  
> -When wrapping standard library functions, use the prefix ``qemu_`` to alert
> -readers that they are seeing a wrapped version; otherwise avoid this prefix.
> +Variable Naming Conventions
> +---------------------------
> +
> +A number of short naming conventions exist for variables that use
> +common QEMU types. For example, the architecture independent CPUState
> +is often held as a ``cs`` pointer variable, whereas the concrete
> +CPUArchState is usually held in a pointer called ``env``.
> +
> +Likewise, in device emulation code the common DeviceState is usually
> +called ``dev``.
> +
> +Function Naming Conventions
> +---------------------------
> +
> +Wrapped version of standard library or GLib functions use a ``qemu_``
> +prefix to alert readers that they are seeing a wrapped version, for
> +example ``qemu_strtol`` or ``qemu_mutex_lock``.  Other utility functions
> +that are widely called from across the codebase should not have any
> +prefix, for example ``pstrcpy`` or bit manipulation functions such as
> +``find_first_bit``.
> +
> +The ``qemu_`` prefix is also used for functions that modify global
> +emulator state, for example ``qemu_add_vm_change_state_handler``.
> +However, if there is an obvious subsystem-specific prefix it should be
> +used instead.
> +
> +Public functions from a file or subsystem (declared in headers) tend
> +to have a consistent prefix to show where they came from. For example,
> +``tlb_`` for functions from ``cputlb.c`` or ``cpu_`` for functions
> +from cpus.c.
> +
> +If there are two versions of a function to be called with or without a
> +lock held, the function that expects the lock to be already held
> +usually uses the suffix ``_locked``.
> +

Sounds good to me now.

Reviewed-by: Thomas Huth <thuth@redhat.com>


