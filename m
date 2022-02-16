Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB0F4B7D98
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 03:43:46 +0100 (CET)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKAIC-0005SJ-Rr
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 21:43:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKAFt-0003ag-DY
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:41:28 -0500
Received: from [2607:f8b0:4864:20::c30] (port=36467
 helo=mail-oo1-xc30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKAFr-0000cw-EJ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:41:20 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so958490oov.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 18:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p1l69h+9vkPX9AKixHlHkJzUf/z6mUYtKU3zXZkXIxI=;
 b=K8LymrKrn5DWdVOgNNqS9pJsCE9ZXXUNTu0R8vIafbZtoeRYgo85awFxPXDjaeu/MG
 zPyL2cRzeMExA/WJ+YTrtiXbqrHjtdJDbgA7JZvlqtAufexvdHc8tpMehZWlDV1dQy/f
 AGiuLJVDiOJwqIdSh3GCeoPQguZtGmFQ/xI77+wJbXp9DEReS7M/UBGBoEngKD8obIPi
 xWxZqszEa8HmKxB1DX0Wz5wB7mHiYTgkd1BynvixOjTKTErUUIMf/9fXAVXYzxHT4ZTP
 m8F6VTjkZjYNghN5fzRn3S4OyBOTztwtN5/FrC4LFrOHiNMFX14OVKPUnsBvKWs5TAWU
 ySiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p1l69h+9vkPX9AKixHlHkJzUf/z6mUYtKU3zXZkXIxI=;
 b=OryRvsHv5t9jymzRA5Y0CSfH9CR3OSOLSyLpG9DZUKna4T0HOQJtPRt00k7eK7E7CI
 KgaQM6+O5r830JkuURyBvILa9Xd+mim2Q/pX0ShDd2vM0tSXXytRfBqj/b8xdBXvRXRU
 Z3URWCNn1wTdshuY/gHN/ewZcZk+rZPb8FNHNGj+NbGSDerxhI54U9GXmMXLrBjipdFX
 neMtYvE3F19el1BSSbSVwnwq+0KGWvLdu81s80we0dc3fJNV02uO2x1/vfaLjvH/ZjZ6
 WjgrN/p60VNCJbaGPZ+wbr0yy9bZQIjljWWuDCE3EEydtZPuiRVmRmV23iJTUW8+GPG9
 Cjdw==
X-Gm-Message-State: AOAM530L0iYf87W5B0wVxpJyOps9h9fGDmiqxVMknZOf35+fzgnUgPej
 wsij8wJ5Eacb6cf7cM0Hfed3acP/beysqwsG574fPoOA
X-Google-Smtp-Source: ABdhPJwNpuOMEEOwOySnb7CjjNobxL79NUoXcIO0rw7GSs8p1nEywvlY50brm58Lkn/g6cqSRWFTIzk0bkdlGEY8Rfo=
X-Received: by 2002:a05:6870:f78d:b0:d2:73ff:93a8 with SMTP id
 fs13-20020a056870f78d00b000d273ff93a8mr296096oab.193.1644979272478; Tue, 15
 Feb 2022 18:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
In-Reply-To: <20220215170106.95848-5-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 16 Feb 2022 11:41:00 +0900
Message-ID: <CAMVc7JWpEzsquiPTyDcvd6j6Rbfw1_JBipGjizQSH=1x=9aR4Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 2:01 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> GCC 10.1 introduced the -moutline-atomics option on Aarch64.
> This options is enabled by default, and triggers a link failure:
>
>   Undefined symbols for architecture arm64:
>     "___aarch64_cas1_acq_rel", referenced from:
>         _qmp_migrate_recover in migration_migration.c.o
>         _cpu_atomic_cmpxchgb_mmu in accel_tcg_cputlb.c.o
>         _cpu_atomic_fetch_sminb_mmu in accel_tcg_cputlb.c.o
>         _cpu_atomic_fetch_uminb_mmu in accel_tcg_cputlb.c.o
>         _cpu_atomic_fetch_smaxb_mmu in accel_tcg_cputlb.c.o
>         _cpu_atomic_fetch_umaxb_mmu in accel_tcg_cputlb.c.o
>         _cpu_atomic_smin_fetchb_mmu in accel_tcg_cputlb.c.o
>         ...
>     "___aarch64_ldadd4_acq_rel", referenced from:
>         _multifd_recv_new_channel in migration_multifd.c.o
>         _monitor_event in monitor_hmp.c.o
>         _handle_hmp_command in monitor_hmp.c.o
>         _colo_compare_finalize in net_colo-compare.c.o
>         _flatview_unref in softmmu_memory.c.o
>         _virtio_scsi_hotunplug in hw_scsi_virtio-scsi.c.o
>         _tcg_register_thread in tcg_tcg.c.o
>         ...
>     "___aarch64_swp4_acq", referenced from:
>         _qemu_spin_lock in softmmu_cpu-timers.c.o
>         _cpu_get_ticks in softmmu_cpu-timers.c.o
>         _qemu_spin_lock in softmmu_icount.c.o
>         _cpu_exec in accel_tcg_cpu-exec.c.o
>         _page_flush_tb_1.isra.0 in accel_tcg_translate-all.c.o
>         _page_entry_lock in accel_tcg_translate-all.c.o
>         _do_tb_phys_invalidate in accel_tcg_translate-all.c.o
>         ...
>
> QEMU implements its own atomic operations using C11 builtin helpers.
> Disable the GCC out-of-line atomic ops.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
>
> Clearly out of my understanding, but at least it links and the qtests
> pass.
> ---
>  configure | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/configure b/configure
> index 06c03cebd3..3217aa22cb 100755
> --- a/configure
> +++ b/configure
> @@ -2826,6 +2826,18 @@ else
>    avx512f_opt=3D"no"
>  fi
>
> +#########################################
> +# Disable out-of-line atomic operations.
> +
> +case "$cpu" in
> +  aarch64)
> +    write_c_skeleton;
> +    if compile_prog "$CPU_CFLAGS -Werror -mno-outline-atomics" "" ; then
> +      CPU_CFLAGS=3D"-mno-outline-atomics $CPU_CFLAGS"
> +    fi
> +    ;;
> +esac
> +
>  ########################################
>  # check if __[u]int128_t is usable.
>
> --
> 2.34.1
>

This change would (slightly) increase the code size and is harmful to
the other proper GCC installations. The flag should be specified by
the user (or the user should fix the GCC installation.)

