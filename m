Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F5A2B161F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 08:01:43 +0100 (CET)
Received: from localhost ([::1]:45956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdT5a-0004Pe-Ls
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 02:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdT21-0001M6-L5
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdT1y-0007zH-Fy
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605250677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tjyq7wQbzWA+hNkDWk0JPC6wVVO2aFRUU5h/DqYw3c=;
 b=AykefwYOYsv5m3bcNLazVz/OAM7fldM8LMNxnbCsqkqVEh4FtELll9lfo65vMhc1H4QDvy
 7hF3SChzRQ/D89jMSQyADms9Pdamg9magJAc74Dk+iiPdkVNpEq4njwwSe4Vm1fjs4kXmA
 TCvmOXfRCYmbwbMvRuCM8Qe57F9x5BU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-4gbeK8RpOfSZ4rA_6gcBdw-1; Fri, 13 Nov 2020 01:57:55 -0500
X-MC-Unique: 4gbeK8RpOfSZ4rA_6gcBdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A79175F9EC;
 Fri, 13 Nov 2020 06:57:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-177.ams2.redhat.com [10.36.112.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FB3460C0F;
 Fri, 13 Nov 2020 06:57:51 +0000 (UTC)
Subject: Re: [PATCH 22/30] overall/alpha tcg cpus|hppa: Fix Lesser GPL version
 number
To: Chetan Pant <chetan4windows@gmail.com>, qemu-trivial@nongnu.org
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023123353.19796-1-chetan4windows@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fd95904a-0660-ef81-7338-5057ac57674d@redhat.com>
Date: Fri, 13 Nov 2020 07:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201023123353.19796-1-chetan4windows@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/2020 14.33, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>  cpus-common.c             | 2 +-
>  include/exec/cpu-all.h    | 2 +-
>  include/exec/cpu-defs.h   | 2 +-
>  include/exec/cpu_ldst.h   | 2 +-
>  include/exec/cputlb.h     | 2 +-
>  include/exec/exec-all.h   | 2 +-
>  include/exec/tb-hash.h    | 2 +-
>  scripts/decodetree.py     | 2 +-
>  target/alpha/cpu.h        | 2 +-
>  target/alpha/fpu_helper.c | 2 +-
>  target/alpha/gdbstub.c    | 2 +-
>  target/alpha/helper.c     | 2 +-
>  target/alpha/int_helper.c | 2 +-
>  target/alpha/mem_helper.c | 2 +-
>  target/alpha/sys_helper.c | 2 +-
>  target/alpha/translate.c  | 2 +-
>  target/alpha/vax_helper.c | 2 +-
>  target/hppa/cpu.h         | 2 +-
>  target/hppa/gdbstub.c     | 2 +-
>  target/hppa/helper.c      | 2 +-
>  target/hppa/insns.decode  | 2 +-
>  target/hppa/int_helper.c  | 2 +-
>  target/hppa/machine.c     | 2 +-
>  target/hppa/mem_helper.c  | 2 +-
>  target/hppa/op_helper.c   | 2 +-
>  target/hppa/translate.c   | 2 +-
>  26 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/cpus-common.c b/cpus-common.c
> index 83475ef..6e73d3e 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index f6439c4..1c92ab6 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index 9185632..d1f5e3f 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 30605ed..ef54cb7 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -4,7 +4,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
> index a62cfb2..19b16e5 100644
> --- a/include/exec/cputlb.h
> +++ b/include/exec/cputlb.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 1fe28d5..5ebe5d4 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/include/exec/tb-hash.h b/include/exec/tb-hash.h
> index 805235d..0a273d9 100644
> --- a/include/exec/tb-hash.h
> +++ b/include/exec/tb-hash.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 60fd3b5..157b1e8 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -4,7 +4,7 @@
>  # This library is free software; you can redistribute it and/or
>  # modify it under the terms of the GNU Lesser General Public
>  # License as published by the Free Software Foundation; either
> -# version 2 of the License, or (at your option) any later version.
> +# version 2.1 of the License, or (at your option) any later version.
>  #
>  # This library is distributed in the hope that it will be useful,
>  # but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index be29bdd..82df108 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/alpha/fpu_helper.c b/target/alpha/fpu_helper.c
> index df8b589..3ff8bb4 100644
> --- a/target/alpha/fpu_helper.c
> +++ b/target/alpha/fpu_helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/alpha/gdbstub.c b/target/alpha/gdbstub.c
> index 0cd76dd..7db14f4 100644
> --- a/target/alpha/gdbstub.c
> +++ b/target/alpha/gdbstub.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/alpha/helper.c b/target/alpha/helper.c
> index 55d7274..4f56fe4 100644
> --- a/target/alpha/helper.c
> +++ b/target/alpha/helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/alpha/int_helper.c b/target/alpha/int_helper.c
> index e43b50a..5672696 100644
> --- a/target/alpha/int_helper.c
> +++ b/target/alpha/int_helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/alpha/mem_helper.c b/target/alpha/mem_helper.c
> index 934faa1..75e72bc 100644
> --- a/target/alpha/mem_helper.c
> +++ b/target/alpha/mem_helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
> index 3922923..25f6cb8 100644
> --- a/target/alpha/sys_helper.c
> +++ b/target/alpha/sys_helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/alpha/translate.c b/target/alpha/translate.c
> index 8870284..ba5bba7 100644
> --- a/target/alpha/translate.c
> +++ b/target/alpha/translate.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/alpha/vax_helper.c b/target/alpha/vax_helper.c
> index 2b0c178..f94fb51 100644
> --- a/target/alpha/vax_helper.c
> +++ b/target/alpha/vax_helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index fb6c59d..61178fa 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/hppa/gdbstub.c b/target/hppa/gdbstub.c
> index a6428a2..729c37b 100644
> --- a/target/hppa/gdbstub.c
> +++ b/target/hppa/gdbstub.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/hppa/helper.c b/target/hppa/helper.c
> index 0dcd105..1ccff57 100644
> --- a/target/hppa/helper.c
> +++ b/target/hppa/helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/hppa/insns.decode b/target/hppa/insns.decode
> index dceaad6..d4eefc0 100644
> --- a/target/hppa/insns.decode
> +++ b/target/hppa/insns.decode
> @@ -6,7 +6,7 @@
>  # This library is free software; you can redistribute it and/or
>  # modify it under the terms of the GNU Lesser General Public
>  # License as published by the Free Software Foundation; either
> -# version 2 of the License, or (at your option) any later version.
> +# version 2.1 of the License, or (at your option) any later version.
>  #
>  # This library is distributed in the hope that it will be useful,
>  # but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
> index 462747b..349495d 100644
> --- a/target/hppa/int_helper.c
> +++ b/target/hppa/int_helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/hppa/machine.c b/target/hppa/machine.c
> index 7030101..b60b654 100644
> --- a/target/hppa/machine.c
> +++ b/target/hppa/machine.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
> index 5a465db..afc5b56 100644
> --- a/target/hppa/mem_helper.c
> +++ b/target/hppa/mem_helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
> index 39361d3..7ae31e1 100644
> --- a/target/hppa/op_helper.c
> +++ b/target/hppa/op_helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index f5765ef..64af1e0 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


