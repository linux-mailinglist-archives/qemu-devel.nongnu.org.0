Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA048852E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 19:06:36 +0100 (CET)
Received: from localhost ([::1]:47128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6G6t-0008VM-DP
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 13:06:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6G4E-0007GZ-7X
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:03:50 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:44213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6G4A-0001t2-PO
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:03:49 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWBC8-1mrMrW0FcA-00XfNE; Sat, 08 Jan 2022 19:03:40 +0100
Message-ID: <e423ace2-f0a9-ec55-6751-d7594fb660c1@vivier.eu>
Date: Sat, 8 Jan 2022 19:03:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] linux-user: Move target_struct.h generic definitions
 to generic/
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220107042600.149852-1-richard.henderson@linaro.org>
 <20220107042600.149852-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220107042600.149852-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l+AwQ+4ZJGKoE2govFVx5bMDbuM5j/jczrD0uDK7EZN501XmRKy
 FcH6ECNWSuW25bwba+8VRtVpbNdXJuh1FG0xfTDpuY71JdmfB7XpAjhC3Hfym5n6UUzeoi3
 2GkpAFu6oBr2ACKsB4/UWCdoBkwRLfJnzGKbClLH0E/2bSI0lJzSYVHaIW7Wolw+BLX50RS
 jJ3VzvEsZhQnsyCDrq/3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NRG6de65Evs=:8VCXXqDt7yQsW42JIZVZS8
 ezboXjBAElnRHtR3r4equqvBpx/10o1RxZLA6e+0efbHO7qS6u6/1LyCdZUHNvtJfPFBqWqkh
 O12SheCzDysgJw/bRoAtTpBPM8kxNj4fIGDb/FYCnB4RCZlairhusK3noi/z2+orHDHCOmrwo
 b0QkPUo0FRh1WGErxluqvf0M2lTmJscNB5z0Ev5KQchMKgAVrSRL3p/scSKYAtGdLCEybYxxM
 /HdfzlJBBS3GohKlkqSOz/iUnzlAxJKA3TLeQu2BKMgBJ5ttE8kk5t5rmI6DB6ZU2z5VKI1O7
 qR7tMU0ttZjIw7YsQb9WD6PhgAjSJyYFUfJ89wTHrqvo18rokIYtQ1c8VnmqdLmRHJ1C368dW
 Jnn492GUN0GJ4L28yF7HWJjRZtnAcS73XyfdoiUKEjZjQNiM8CuxY84p609H12h9KN8w2bXdW
 AjaIy6bMHZTS5LKTlbBEg4HaspH3VekfOG38wrvmOfCKgZizvau3t20JIRtOuSGiZfzcic3+U
 1hjLJ69OwvNbZONvI1O4VlToNFz8kW0gVYqFTl0YFdrQwqdprzyG1hUwvFCiMA1xhevPJGyVC
 0TMT8oLMHPAVTmVQY/FMR89irp+uIVd4ixMLOykUG/evs2IXjd1iyMBiBjXeJ/PRcYvs9jqyh
 o6puXSK2PdrVGAWeRIK8Tt8GrYVzEUKc1CPZ3M+knS5+EAWz4yZ3YEiqRzHbLNsh52J4=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/01/2022 à 05:26, Richard Henderson a écrit :
> Most targets share the same generic ipc structure definitions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/target_structs.h    | 59 +-------------------------
>   linux-user/arm/target_structs.h        | 52 +----------------------
>   linux-user/cris/target_structs.h       | 59 +-------------------------
>   linux-user/generic/target_structs.h    | 58 +++++++++++++++++++++++++
>   linux-user/hexagon/target_structs.h    | 55 +-----------------------
>   linux-user/i386/target_structs.h       | 59 +-------------------------
>   linux-user/m68k/target_structs.h       | 59 +-------------------------
>   linux-user/microblaze/target_structs.h | 59 +-------------------------
>   linux-user/nios2/target_structs.h      | 59 +-------------------------
>   linux-user/openrisc/target_structs.h   | 59 +-------------------------
>   linux-user/riscv/target_structs.h      | 47 +-------------------
>   linux-user/sh4/target_structs.h        | 59 +-------------------------
>   linux-user/x86_64/target_structs.h     | 36 +---------------
>   13 files changed, 70 insertions(+), 650 deletions(-)
>   create mode 100644 linux-user/generic/target_structs.h
> 
> diff --git a/linux-user/aarch64/target_structs.h b/linux-user/aarch64/target_structs.h
> index 7c748344ca..3a06f373c3 100644
> --- a/linux-user/aarch64/target_structs.h
> +++ b/linux-user/aarch64/target_structs.h
> @@ -1,58 +1 @@
> -/*
> - * ARM AArch64 specific structures for linux-user
> - *
> - * Copyright (c) 2013 Fabrice Bellard
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef AARCH64_TARGET_STRUCTS_H
> -#define AARCH64_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/arm/target_structs.h b/linux-user/arm/target_structs.h
> index 25bf8dd3a5..3a06f373c3 100644
> --- a/linux-user/arm/target_structs.h
> +++ b/linux-user/arm/target_structs.h
> @@ -1,51 +1 @@
> -/*
> - * ARM specific structures for linux-user
> - *
> - * Copyright (c) 2013 Fabrice Bellard
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef ARM_TARGET_STRUCTS_H
> -#define ARM_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -    abi_ulong __unused1;
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -    abi_ulong __unused2;
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -    abi_ulong __unused3;
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/cris/target_structs.h b/linux-user/cris/target_structs.h
> index f949d2331e..3a06f373c3 100644
> --- a/linux-user/cris/target_structs.h
> +++ b/linux-user/cris/target_structs.h
> @@ -1,58 +1 @@
> -/*
> - * CRIS specific structures for linux-user
> - *
> - * Copyright (c) 2013 Fabrice Bellard
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef CRIS_TARGET_STRUCTS_H
> -#define CRIS_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/generic/target_structs.h b/linux-user/generic/target_structs.h
> new file mode 100644
> index 0000000000..09ff858b6e
> --- /dev/null
> +++ b/linux-user/generic/target_structs.h
> @@ -0,0 +1,58 @@
> +/*
> + * Generic structures for linux-user
> + *
> + * Copyright (c) 2013 Fabrice Bellard
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef GENERIC_TARGET_STRUCTS_H
> +#define GENERIC_TARGET_STRUCTS_H
> +
> +struct target_ipc_perm {
> +    abi_int __key;                      /* Key.  */
> +    abi_uint uid;                       /* Owner's user ID.  */
> +    abi_uint gid;                       /* Owner's group ID.  */
> +    abi_uint cuid;                      /* Creator's user ID.  */
> +    abi_uint cgid;                      /* Creator's group ID.  */
> +    abi_ushort mode;                    /* Read/write permission.  */
> +    abi_ushort __pad1;
> +    abi_ushort __seq;                   /* Sequence number.  */
> +    abi_ushort __pad2;
> +    abi_ulong __unused1;
> +    abi_ulong __unused2;
> +};
> +
> +struct target_shmid_ds {
> +    struct target_ipc_perm shm_perm;    /* operation permission struct */
> +    abi_long shm_segsz;                 /* size of segment in bytes */
> +    abi_ulong shm_atime;                /* time of last shmat() */
> +#if TARGET_ABI_BITS == 32
> +    abi_ulong __unused1;
> +#endif
> +    abi_ulong shm_dtime;                /* time of last shmdt() */
> +#if TARGET_ABI_BITS == 32
> +    abi_ulong __unused2;
> +#endif
> +    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> +#if TARGET_ABI_BITS == 32
> +    abi_ulong __unused3;
> +#endif
> +    abi_int shm_cpid;                   /* pid of creator */
> +    abi_int shm_lpid;                   /* pid of last shmop */
> +    abi_ulong shm_nattch;               /* number of current attaches */
> +    abi_ulong __unused4;
> +    abi_ulong __unused5;
> +};
> +
> +#endif
> diff --git a/linux-user/hexagon/target_structs.h b/linux-user/hexagon/target_structs.h
> index c217d9442a..3a06f373c3 100644
> --- a/linux-user/hexagon/target_structs.h
> +++ b/linux-user/hexagon/target_structs.h
> @@ -1,54 +1 @@
> -/*
> - *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> - *
> - *  This program is free software; you can redistribute it and/or modify
> - *  it under the terms of the GNU General Public License as published by
> - *  the Free Software Foundation; either version 2 of the License, or
> - *  (at your option) any later version.
> - *
> - *  This program is distributed in the hope that it will be useful,
> - *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *  GNU General Public License for more details.
> - *
> - *  You should have received a copy of the GNU General Public License
> - *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> - */
> -
> -/*
> - * Hexagon specific structures for linux-user
> - */
> -#ifndef HEXAGON_TARGET_STRUCTS_H
> -#define HEXAGON_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -    abi_ulong __unused1;
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -    abi_ulong __unused2;
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -    abi_ulong __unused3;
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/i386/target_structs.h b/linux-user/i386/target_structs.h
> index e22847fd20..3a06f373c3 100644
> --- a/linux-user/i386/target_structs.h
> +++ b/linux-user/i386/target_structs.h
> @@ -1,58 +1 @@
> -/*
> - * i386 specific structures for linux-user
> - *
> - * Copyright (c) 2013 Fabrice Bellard
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef I386_TARGET_STRUCTS_H
> -#define I386_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/m68k/target_structs.h b/linux-user/m68k/target_structs.h
> index e373d481e1..3a06f373c3 100644
> --- a/linux-user/m68k/target_structs.h
> +++ b/linux-user/m68k/target_structs.h
> @@ -1,58 +1 @@
> -/*
> - * m68k specific structures for linux-user
> - *
> - * Copyright (c) 2013 Fabrice Bellard
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef M68K_TARGET_STRUCTS_H
> -#define M68K_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/microblaze/target_structs.h b/linux-user/microblaze/target_structs.h
> index d08f6a53a8..3a06f373c3 100644
> --- a/linux-user/microblaze/target_structs.h
> +++ b/linux-user/microblaze/target_structs.h
> @@ -1,58 +1 @@
> -/*
> - * MicroBlaze specific structures for linux-user
> - *
> - * Copyright (c) 2013 Fabrice Bellard
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef MICROBLAZE_TARGET_STRUCTS_H
> -#define MICROBLAZE_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/nios2/target_structs.h b/linux-user/nios2/target_structs.h
> index daa2886f98..3a06f373c3 100644
> --- a/linux-user/nios2/target_structs.h
> +++ b/linux-user/nios2/target_structs.h
> @@ -1,58 +1 @@
> -/*
> - * Nios2 specific structures for linux-user
> - *
> - * Copyright (c) 2016 Marek Vasut <marex@denx.de>
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef NIOS2_TARGET_STRUCTS_H
> -#define NIOS2_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/openrisc/target_structs.h b/linux-user/openrisc/target_structs.h
> index e98e2bc799..3a06f373c3 100644
> --- a/linux-user/openrisc/target_structs.h
> +++ b/linux-user/openrisc/target_structs.h
> @@ -1,58 +1 @@
> -/*
> - * OpenRISC specific structures for linux-user
> - *
> - * Copyright (c) 2013 Fabrice Bellard
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef OPENRISC_TARGET_STRUCTS_H
> -#define OPENRISC_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/riscv/target_structs.h b/linux-user/riscv/target_structs.h
> index ea3e5ed17e..3a06f373c3 100644
> --- a/linux-user/riscv/target_structs.h
> +++ b/linux-user/riscv/target_structs.h
> @@ -1,46 +1 @@
> -/*
> - * RISC-V specific structures for linux-user
> - *
> - * This is a copy of ../aarch64/target_structs.h atm.
> - *
> - */
> -#ifndef RISCV_TARGET_STRUCTS_H
> -#define RISCV_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/sh4/target_structs.h b/linux-user/sh4/target_structs.h
> index 00ac39478b..3a06f373c3 100644
> --- a/linux-user/sh4/target_structs.h
> +++ b/linux-user/sh4/target_structs.h
> @@ -1,58 +1 @@
> -/*
> - * SH4 specific structures for linux-user
> - *
> - * Copyright (c) 2013 Fabrice Bellard
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#ifndef SH4_TARGET_STRUCTS_H
> -#define SH4_TARGET_STRUCTS_H
> -
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> -
> -#endif
> +#include "../generic/target_structs.h"
> diff --git a/linux-user/x86_64/target_structs.h b/linux-user/x86_64/target_structs.h
> index ce367b253b..f1181383c4 100644
> --- a/linux-user/x86_64/target_structs.h
> +++ b/linux-user/x86_64/target_structs.h
> @@ -19,41 +19,7 @@
>   #ifndef X86_64_TARGET_STRUCTS_H
>   #define X86_64_TARGET_STRUCTS_H
>   
> -struct target_ipc_perm {
> -    abi_int __key;                      /* Key.  */
> -    abi_uint uid;                       /* Owner's user ID.  */
> -    abi_uint gid;                       /* Owner's group ID.  */
> -    abi_uint cuid;                      /* Creator's user ID.  */
> -    abi_uint cgid;                      /* Creator's group ID.  */
> -    abi_ushort mode;                    /* Read/write permission.  */
> -    abi_ushort __pad1;
> -    abi_ushort __seq;                   /* Sequence number.  */
> -    abi_ushort __pad2;
> -    abi_ulong __unused1;
> -    abi_ulong __unused2;
> -};
> -
> -struct target_shmid_ds {
> -    struct target_ipc_perm shm_perm;    /* operation permission struct */
> -    abi_long shm_segsz;                 /* size of segment in bytes */
> -    abi_ulong shm_atime;                /* time of last shmat() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused1;
> -#endif
> -    abi_ulong shm_dtime;                /* time of last shmdt() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused2;
> -#endif
> -    abi_ulong shm_ctime;                /* time of last change by shmctl() */
> -#if TARGET_ABI_BITS == 32
> -    abi_ulong __unused3;
> -#endif
> -    abi_int shm_cpid;                   /* pid of creator */
> -    abi_int shm_lpid;                   /* pid of last shmop */
> -    abi_ulong shm_nattch;               /* number of current attaches */
> -    abi_ulong __unused4;
> -    abi_ulong __unused5;
> -};
> +#include "../generic/target_structs.h"
>   
>   /* The x86 definition differs from the generic one in that the
>    * two padding fields exist whether the ABI is 32 bits or 64 bits.

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


