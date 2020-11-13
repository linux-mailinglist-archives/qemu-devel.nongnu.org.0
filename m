Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB112B1615
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 07:58:14 +0100 (CET)
Received: from localhost ([::1]:37592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdT2C-0000Yu-UV
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 01:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdSzE-00076V-ND
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdSzC-00076g-3B
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605250501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjZrpeNhcOUra/2CMQv+SF8DrbfsJyNYAWGxV8coxz8=;
 b=LVHR79p6ahmsrka0CSlurvUtEsq7VvlvBFDFTm+1uk9u4RbvU/gnvMr6uxHPvDhLddz1Zu
 73Sp8tUoMOJI7WiwumuwJDey/j6bC1a6GXqaPoRxgxI3mD7LHALy7S65rntTkZp+rFK6gZ
 ZmPMLVXbq4hcFrkopd2zbheqzMEnfZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-GaQfLEL7O2i6vLLoFIh6FA-1; Fri, 13 Nov 2020 01:54:19 -0500
X-MC-Unique: GaQfLEL7O2i6vLLoFIh6FA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A121186DD45;
 Fri, 13 Nov 2020 06:54:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-177.ams2.redhat.com [10.36.112.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C8791002C0A;
 Fri, 13 Nov 2020 06:54:16 +0000 (UTC)
Subject: Re: [PATCH 27/30] x86 hvf cpus: Fix Lesser GPL version number
To: Chetan Pant <chetan4windows@gmail.com>, qemu-trivial@nongnu.org
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023124012.20035-1-chetan4windows@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b3f6e965-02db-2238-e6a0-22635fd9dabc@redhat.com>
Date: Fri, 13 Nov 2020 07:54:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201023124012.20035-1-chetan4windows@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, dirty@apple.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/2020 14.40, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>  target/i386/hvf/panic.h      | 2 +-
>  target/i386/hvf/vmx.h        | 2 +-
>  target/i386/hvf/x86.c        | 2 +-
>  target/i386/hvf/x86.h        | 2 +-
>  target/i386/hvf/x86_cpuid.c  | 2 +-
>  target/i386/hvf/x86_decode.c | 2 +-
>  target/i386/hvf/x86_decode.h | 2 +-
>  target/i386/hvf/x86_descr.c  | 2 +-
>  target/i386/hvf/x86_descr.h  | 2 +-
>  target/i386/hvf/x86_emu.c    | 4 ++--
>  target/i386/hvf/x86_emu.h    | 2 +-
>  target/i386/hvf/x86_flags.c  | 2 +-
>  target/i386/hvf/x86_flags.h  | 2 +-
>  target/i386/hvf/x86_mmu.c    | 2 +-
>  target/i386/hvf/x86_mmu.h    | 2 +-
>  target/i386/hvf/x86hvf.c     | 2 +-
>  target/i386/hvf/x86hvf.h     | 2 +-
>  17 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/target/i386/hvf/panic.h b/target/i386/hvf/panic.h
> index 411ef43..a3eabeb 100644
> --- a/target/i386/hvf/panic.h
> +++ b/target/i386/hvf/panic.h
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
> index 587b1b8..24c4cdf 100644
> --- a/target/i386/hvf/vmx.h
> +++ b/target/i386/hvf/vmx.h
> @@ -8,7 +8,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c
> index fdb11c8..cd04518 100644
> --- a/target/i386/hvf/x86.c
> +++ b/target/i386/hvf/x86.c
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h
> index bacade7..9e2c003 100644
> --- a/target/i386/hvf/x86.h
> +++ b/target/i386/hvf/x86.h
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index 16762b6..ac731c2 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -7,7 +7,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
> index 34c5e30..062713b 100644
> --- a/target/i386/hvf/x86_decode.c
> +++ b/target/i386/hvf/x86_decode.c
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_decode.h b/target/i386/hvf/x86_decode.h
> index ef79601..a2d7a2a 100644
> --- a/target/i386/hvf/x86_decode.h
> +++ b/target/i386/hvf/x86_decode.h
> @@ -4,7 +4,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_descr.c b/target/i386/hvf/x86_descr.c
> index 8c05c34..9f539e7 100644
> --- a/target/i386/hvf/x86_descr.c
> +++ b/target/i386/hvf/x86_descr.c
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_descr.h b/target/i386/hvf/x86_descr.h
> index 049ef9a..c356932 100644
> --- a/target/i386/hvf/x86_descr.h
> +++ b/target/i386/hvf/x86_descr.h
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index d3e289e..da570e3 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> @@ -23,7 +23,7 @@
>  //  This library is free software; you can redistribute it and/or
>  //  modify it under the terms of the GNU Lesser General Public
>  //  License as published by the Free Software Foundation; either
> -//  version 2 of the License, or (at your option) any later version.
> +//  version 2.1 of the License, or (at your option) any later version.
>  //
>  //  This library is distributed in the hope that it will be useful,
>  //  but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_emu.h b/target/i386/hvf/x86_emu.h
> index f92a9c5..233f7b8 100644
> --- a/target/i386/hvf/x86_emu.h
> +++ b/target/i386/hvf/x86_emu.h
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_flags.c b/target/i386/hvf/x86_flags.c
> index 5ca4f41..fecbca7 100644
> --- a/target/i386/hvf/x86_flags.c
> +++ b/target/i386/hvf/x86_flags.c
> @@ -6,7 +6,7 @@
>  //  This library is free software; you can redistribute it and/or
>  //  modify it under the terms of the GNU Lesser General Public
>  //  License as published by the Free Software Foundation; either
> -//  version 2 of the License, or (at your option) any later version.
> +//  version 2.1 of the License, or (at your option) any later version.
>  //
>  //  This library is distributed in the hope that it will be useful,
>  //  but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_flags.h b/target/i386/hvf/x86_flags.h
> index 785e80c..75c2a7f 100644
> --- a/target/i386/hvf/x86_flags.h
> +++ b/target/i386/hvf/x86_flags.h
> @@ -6,7 +6,7 @@
>  //  This library is free software; you can redistribute it and/or
>  //  modify it under the terms of the GNU Lesser General Public
>  //  License as published by the Free Software Foundation; either
> -//  version 2 of the License, or (at your option) any later version.
> +//  version 2.1 of the License, or (at your option) any later version.
>  //
>  //  This library is distributed in the hope that it will be useful,
>  //  but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
> index 65d4603..882a623 100644
> --- a/target/i386/hvf/x86_mmu.c
> +++ b/target/i386/hvf/x86_mmu.c
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_mmu.h b/target/i386/hvf/x86_mmu.h
> index cd6e137..9ae8a54 100644
> --- a/target/i386/hvf/x86_mmu.h
> +++ b/target/i386/hvf/x86_mmu.h
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 5cbcb32..f267698 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -6,7 +6,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
> index 79539f7..860bd2e 100644
> --- a/target/i386/hvf/x86hvf.h
> +++ b/target/i386/hvf/x86hvf.h
> @@ -5,7 +5,7 @@
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


