Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A192F87FE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:56:33 +0100 (CET)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0X56-0002py-82
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0X2L-0001UO-6o; Fri, 15 Jan 2021 16:53:41 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:43898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0X2I-0003yl-4S; Fri, 15 Jan 2021 16:53:40 -0500
Received: by mail-io1-xd2b.google.com with SMTP id x21so2807644iog.10;
 Fri, 15 Jan 2021 13:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=117kmnDS7NHMiDgnCAcTX9lI3dcJXGQaYDnlKt9Yp2s=;
 b=PlRUUHsIfByOWyKGt4LQ+KRwXco+1w5tdOdsa769MQ2PQG96bI5nRPbpns2vVcewSW
 bELk9kKOC4SGL7AWtxd9ZLWA4pcgdpkL21N+T8TgGEr/Ot+oR6BkwOrzFnS94XXoU80a
 6WB7VatcYC+tcwNJs4PVs+5n5pOKqjNshhx/YpS9HFGtMWS1qlm1ADQx0DYbFAZrq/Yn
 0Ywy8p9858K31ir6pvGZ1MdmgPltucMSTQAoMfkXsD9+yFLRomBK0bbLH3EP6wv/Xl40
 9aIQ1dC2YaaPWCCQFM9j1fMZ5UG/c2HlXsZekgQthnQynD2PnJixwAdqf/XT2MGA+BKo
 sqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=117kmnDS7NHMiDgnCAcTX9lI3dcJXGQaYDnlKt9Yp2s=;
 b=G3Y6N27+WerGvduRMKQFwG2sxRJOhS61Mr3mUKgLDjeTd2vSqJscSUZ3XxxbUmSpfi
 HjqwnOYmrSyBT2FcctcY/Kmr/lwI5eWsaJJiHbw8X61Mi5h97zFUDYBmait5E6Q4+ADN
 hd/Mp3fQwedGV6kkk3IwtX2YkbUuK/RLFKLdDLMPgApRbSsmtjaaHbK2djN9WI7BWXkv
 ulBISp7NHLB6xrAQrtveAao5jzkJl9YAhDyeksOo1t1qSJcC1sGfkIyTCkL6RGpOrWwj
 nQAtL52ZV8LgT/h1kWcaUwJMeaAJWUdi/Uwvfx/qupmJFY7z1EI8ksnxQQpDhlM1E0do
 mcvg==
X-Gm-Message-State: AOAM530sU1Jhs4T+t3wNQQVYu19+PsxPHM5qZLS7qPIsaEAWfUQqaTta
 ANEf26EIRZ1dtEec+Yjl2fiX7KZ0cLESRjSqd2k=
X-Google-Smtp-Source: ABdhPJzewAZoCj8/YjVqVawdnvn4v1RoJ0iNc+v5V6+xSQreFpDObFf2DloIS3YFsGAXrFDFHJLYdMOskCKExx1Gb1E=
X-Received: by 2002:a92:c942:: with SMTP id i2mr12341371ilq.227.1610747616478; 
 Fri, 15 Jan 2021 13:53:36 -0800 (PST)
MIME-Version: 1.0
References: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
 <1610427124-49887-3-git-send-email-bmeng.cn@gmail.com>
 <CAEeofcgCkcRw-HcakxY+canSO3=PYfVEvEi_uWdKcW9gydsBiw@mail.gmail.com>
In-Reply-To: <CAEeofcgCkcRw-HcakxY+canSO3=PYfVEvEi_uWdKcW9gydsBiw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 13:53:10 -0800
Message-ID: <CAKmqyKOUYaUZfVUdY7Te6DQ093RKOGoWsC_5UTBdmHAY1ESPeA@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Add CSR name in the CSR function table
To: Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Jim Wilson <jimw@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 5:35 AM Alexander Richardson
<Alexander.Richardson@cl.cam.ac.uk> wrote:
>
> On Tue, 12 Jan 2021 at 05:02, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > In preparation to generate the CSR register list for GDB stub
> > dynamically, let's add the CSR name in the CSR function table.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  target/riscv/cpu.h |   1 +
> >  target/riscv/csr.c | 332 +++++++++++++++++++++++++++++++++++++++--------------
> >  2 files changed, 249 insertions(+), 84 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 6f9e1cc..6684316 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -476,6 +476,7 @@ typedef int (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
> >      target_ulong *ret_value, target_ulong new_value, target_ulong write_mask);
> >
> >  typedef struct {
> > +    const char *name;
> >      riscv_csr_predicate_fn predicate;
> >      riscv_csr_read_fn read;
> >      riscv_csr_write_fn write;
>
> In our CHERI fork, we also added the name to this table for better
> instruction logging output:
> <https://github.com/CTSRD-CHERI/qemu/commit/446dbebdfd7d8f9b75041041f5e8c5ebc8f815b8#diff-ff63c6a6531e6beae8637664aed5a008f79c76b8f14fd941c370d28c670faa12R1396>
> We used some macros to avoid repeating the same string multiple times:
> in that patch we use e.g. [CSR_FCSR] = CSR_OP_RW(fs, fcsr)," instead
> of
> "[CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },"
> Would it make sense to upstream these helper macros? This would
> significantly reduce merge conflicts on our side in the future.

If you send the patches then I'll merge it :)

In general it would be great if you upstream as much as possible. That
will save you work in the long run and help improve the code base.

Alistair

>
> Thanks,
> Alex
>
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 507e8ee..fd2e636 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -1372,112 +1372,276 @@ int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
> >  /* Control and Status Register function table */
> >  riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      /* User Floating-Point CSRs */
> > -    [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
> > -    [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
> > -    [CSR_FCSR] =                { fs,   read_fcsr,        write_fcsr        },
> > +    [CSR_FFLAGS]   = { "fflags",   fs,     read_fflags,  write_fflags },
> > +    [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
> > +    [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
> >      /* Vector CSRs */
> > -    [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
> > -    [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
> > -    [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
> > -    [CSR_VL] =                  { vs,   read_vl                             },
> > -    [CSR_VTYPE] =               { vs,   read_vtype                          },
> > +    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
> > +    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
> > +    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
> > +    [CSR_VL]       = { "vl",       vs,     read_vl                    },
> > +    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
> >      /* User Timers and Counters */
> > -    [CSR_CYCLE] =               { ctr,  read_instret                        },
> > -    [CSR_INSTRET] =             { ctr,  read_instret                        },
> > -    [CSR_CYCLEH] =              { ctr32,  read_instreth                     },
> > -    [CSR_INSTRETH] =            { ctr32,  read_instreth                     },
> > -
> > -    /* In privileged mode, the monitor will have to emulate TIME CSRs only if
> > -     * rdtime callback is not provided by machine/platform emulation */
> > -    [CSR_TIME] =                { ctr,  read_time                           },
> > -    [CSR_TIMEH] =               { ctr32,  read_timeh                        },
> > +    [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
> > +    [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
> > +    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_instreth },
> > +    [CSR_INSTRETH] = { "instreth", ctr32,  read_instreth },
> > +
> > +    /*
> > +     * In privileged mode, the monitor will have to emulate TIME CSRs only if
> > +     * rdtime callback is not provided by machine/platform emulation.
> > +     */
> > +    [CSR_TIME]  = { "time",  ctr,   read_time  },
> > +    [CSR_TIMEH] = { "timeh", ctr32, read_timeh },
> >
> >  #if !defined(CONFIG_USER_ONLY)
> >      /* Machine Timers and Counters */
> > -    [CSR_MCYCLE] =              { any,  read_instret                        },
> > -    [CSR_MINSTRET] =            { any,  read_instret                        },
> > -    [CSR_MCYCLEH] =             { any32,  read_instreth                     },
> > -    [CSR_MINSTRETH] =           { any32,  read_instreth                     },
> > +    [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
> > +    [CSR_MINSTRET]  = { "minstret",  any,   read_instret  },
> > +    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_instreth },
> > +    [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
> >
> >      /* Machine Information Registers */
> > -    [CSR_MVENDORID] =           { any,  read_zero                           },
> > -    [CSR_MARCHID] =             { any,  read_zero                           },
> > -    [CSR_MIMPID] =              { any,  read_zero                           },
> > -    [CSR_MHARTID] =             { any,  read_mhartid                        },
> > +    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> > +    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> > +    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> > +    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> >
> >      /* Machine Trap Setup */
> > -    [CSR_MSTATUS] =             { any,  read_mstatus,     write_mstatus     },
> > -    [CSR_MISA] =                { any,  read_misa,        write_misa        },
> > -    [CSR_MIDELEG] =             { any,  read_mideleg,     write_mideleg     },
> > -    [CSR_MEDELEG] =             { any,  read_medeleg,     write_medeleg     },
> > -    [CSR_MIE] =                 { any,  read_mie,         write_mie         },
> > -    [CSR_MTVEC] =               { any,  read_mtvec,       write_mtvec       },
> > -    [CSR_MCOUNTEREN] =          { any,  read_mcounteren,  write_mcounteren  },
> > +    [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
> > +    [CSR_MISA]        = { "misa",       any,   read_misa,        write_misa        },
> > +    [CSR_MIDELEG]     = { "mideleg",    any,   read_mideleg,     write_mideleg     },
> > +    [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,     write_medeleg     },
> > +    [CSR_MIE]         = { "mie",        any,   read_mie,         write_mie         },
> > +    [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
> > +    [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
> >
> > -    [CSR_MSTATUSH] =            { any32,  read_mstatush,    write_mstatush  },
> > +    [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
> >
> > -    [CSR_MSCOUNTEREN] =         { any,  read_mscounteren, write_mscounteren },
> > +    [CSR_MSCOUNTEREN] = { "msounteren", any,   read_mscounteren, write_mscounteren },
> >
> >      /* Machine Trap Handling */
> > -    [CSR_MSCRATCH] =            { any,  read_mscratch,    write_mscratch    },
> > -    [CSR_MEPC] =                { any,  read_mepc,        write_mepc        },
> > -    [CSR_MCAUSE] =              { any,  read_mcause,      write_mcause      },
> > -    [CSR_MBADADDR] =            { any,  read_mbadaddr,    write_mbadaddr    },
> > -    [CSR_MIP] =                 { any,  NULL,     NULL,     rmw_mip         },
> > +    [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch },
> > +    [CSR_MEPC]     = { "mepc",     any,  read_mepc,     write_mepc     },
> > +    [CSR_MCAUSE]   = { "mcause",   any,  read_mcause,   write_mcause   },
> > +    [CSR_MBADADDR] = { "mbadaddr", any,  read_mbadaddr, write_mbadaddr },
> > +    [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
> >
> >      /* Supervisor Trap Setup */
> > -    [CSR_SSTATUS] =             { smode, read_sstatus,     write_sstatus     },
> > -    [CSR_SIE] =                 { smode, read_sie,         write_sie         },
> > -    [CSR_STVEC] =               { smode, read_stvec,       write_stvec       },
> > -    [CSR_SCOUNTEREN] =          { smode, read_scounteren,  write_scounteren  },
> > +    [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus    },
> > +    [CSR_SIE]        = { "sie",        smode, read_sie,        write_sie        },
> > +    [CSR_STVEC]      = { "stvec",      smode, read_stvec,      write_stvec      },
> > +    [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren, write_scounteren },
> >
> >      /* Supervisor Trap Handling */
> > -    [CSR_SSCRATCH] =            { smode, read_sscratch,    write_sscratch    },
> > -    [CSR_SEPC] =                { smode, read_sepc,        write_sepc        },
> > -    [CSR_SCAUSE] =              { smode, read_scause,      write_scause      },
> > -    [CSR_SBADADDR] =            { smode, read_sbadaddr,    write_sbadaddr    },
> > -    [CSR_SIP] =                 { smode, NULL,     NULL,     rmw_sip         },
> > +    [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch },
> > +    [CSR_SEPC]     = { "sepc",     smode, read_sepc,     write_sepc     },
> > +    [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
> > +    [CSR_SBADADDR] = { "sbadaddr", smode, read_sbadaddr, write_sbadaddr },
> > +    [CSR_SIP]      = { "sip",      smode, NULL,    NULL, rmw_sip        },
> >
> >      /* Supervisor Protection and Translation */
> > -    [CSR_SATP] =                { smode, read_satp,        write_satp        },
> > -
> > -    [CSR_HSTATUS] =             { hmode,   read_hstatus,     write_hstatus    },
> > -    [CSR_HEDELEG] =             { hmode,   read_hedeleg,     write_hedeleg    },
> > -    [CSR_HIDELEG] =             { hmode,   read_hideleg,     write_hideleg    },
> > -    [CSR_HVIP] =                { hmode,   NULL,     NULL,     rmw_hvip       },
> > -    [CSR_HIP] =                 { hmode,   NULL,     NULL,     rmw_hip        },
> > -    [CSR_HIE] =                 { hmode,   read_hie,         write_hie        },
> > -    [CSR_HCOUNTEREN] =          { hmode,   read_hcounteren,  write_hcounteren },
> > -    [CSR_HGEIE] =               { hmode,   read_hgeie,       write_hgeie      },
> > -    [CSR_HTVAL] =               { hmode,   read_htval,       write_htval      },
> > -    [CSR_HTINST] =              { hmode,   read_htinst,      write_htinst     },
> > -    [CSR_HGEIP] =               { hmode,   read_hgeip,       write_hgeip      },
> > -    [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
> > -    [CSR_HTIMEDELTA] =          { hmode,   read_htimedelta,  write_htimedelta },
> > -    [CSR_HTIMEDELTAH] =         { hmode32,   read_htimedeltah, write_htimedeltah},
> > -
> > -    [CSR_VSSTATUS] =            { hmode,   read_vsstatus,    write_vsstatus   },
> > -    [CSR_VSIP] =                { hmode,   NULL,     NULL,     rmw_vsip       },
> > -    [CSR_VSIE] =                { hmode,   read_vsie,        write_vsie       },
> > -    [CSR_VSTVEC] =              { hmode,   read_vstvec,      write_vstvec     },
> > -    [CSR_VSSCRATCH] =           { hmode,   read_vsscratch,   write_vsscratch  },
> > -    [CSR_VSEPC] =               { hmode,   read_vsepc,       write_vsepc      },
> > -    [CSR_VSCAUSE] =             { hmode,   read_vscause,     write_vscause    },
> > -    [CSR_VSTVAL] =              { hmode,   read_vstval,      write_vstval     },
> > -    [CSR_VSATP] =               { hmode,   read_vsatp,       write_vsatp      },
> > -
> > -    [CSR_MTVAL2] =              { hmode,   read_mtval2,      write_mtval2     },
> > -    [CSR_MTINST] =              { hmode,   read_mtinst,      write_mtinst     },
> > +    [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
> > +
> > +    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,     write_hstatus     },
> > +    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,     write_hedeleg     },
> > +    [CSR_HIDELEG]     = { "hideleg",     hmode,   read_hideleg,     write_hideleg     },
> > +    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,     rmw_hvip          },
> > +    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
> > +    [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
> > +    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
> > +    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
> > +    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
> > +    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
> > +    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,       write_hgeip       },
> > +    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
> > +    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
> > +    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
> > +
> > +    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
> > +    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
> > +    [CSR_VSIE]        = { "vsie",        hmode,   read_vsie,        write_vsie        },
> > +    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,      write_vstvec      },
> > +    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,   write_vsscratch   },
> > +    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,       write_vsepc       },
> > +    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,     write_vscause     },
> > +    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,      write_vstval      },
> > +    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,       write_vsatp       },
> > +
> > +    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
> > +    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
> >
> >      /* Physical Memory Protection */
> > -    [CSR_PMPCFG0  ... CSR_PMPCFG3]   = { pmp,   read_pmpcfg,  write_pmpcfg   },
> > -    [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
> > +    [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
> > +    [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
> > +    [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
> > +    [CSR_PMPCFG3]    = { "pmpcfg3",   pmp, read_pmpcfg,  write_pmpcfg  },
> > +    [CSR_PMPADDR0]   = { "pmpaddr0",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR1]   = { "pmpaddr1",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR2]   = { "pmpaddr2",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR3]   = { "pmpaddr3",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR4]   = { "pmpaddr4",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR5]   = { "pmpaddr5",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR6]   = { "pmpaddr6",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR7]   = { "pmpaddr7",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR8]   = { "pmpaddr8",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR9]   = { "pmpaddr9",  pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR10]  = { "pmpaddr10", pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR11]  = { "pmpaddr11", pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR12]  = { "pmpaddr12", pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR13]  = { "pmpaddr13", pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
> > +    [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
> >
> >      /* Performance Counters */
> > -    [CSR_HPMCOUNTER3   ... CSR_HPMCOUNTER31] =    { ctr,  read_zero          },
> > -    [CSR_MHPMCOUNTER3  ... CSR_MHPMCOUNTER31] =   { any,  read_zero          },
> > -    [CSR_MHPMEVENT3    ... CSR_MHPMEVENT31] =     { any,  read_zero          },
> > -    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =   { ctr32,  read_zero        },
> > -    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =  { any32,  read_zero        },
> > +    [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_zero },
> > +    [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_zero },
> > +    [CSR_HPMCOUNTER5]    = { "hpmcounter5",    ctr,    read_zero },
> > +    [CSR_HPMCOUNTER6]    = { "hpmcounter6",    ctr,    read_zero },
> > +    [CSR_HPMCOUNTER7]    = { "hpmcounter7",    ctr,    read_zero },
> > +    [CSR_HPMCOUNTER8]    = { "hpmcounter8",    ctr,    read_zero },
> > +    [CSR_HPMCOUNTER9]    = { "hpmcounter9",    ctr,    read_zero },
> > +    [CSR_HPMCOUNTER10]   = { "hpmcounter10",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER11]   = { "hpmcounter11",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER12]   = { "hpmcounter12",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER13]   = { "hpmcounter13",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER14]   = { "hpmcounter14",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER15]   = { "hpmcounter15",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER16]   = { "hpmcounter16",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER17]   = { "hpmcounter17",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER18]   = { "hpmcounter18",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER19]   = { "hpmcounter19",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER20]   = { "hpmcounter20",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER21]   = { "hpmcounter21",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER22]   = { "hpmcounter22",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER23]   = { "hpmcounter23",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER24]   = { "hpmcounter24",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER25]   = { "hpmcounter25",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER26]   = { "hpmcounter26",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER27]   = { "hpmcounter27",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER28]   = { "hpmcounter28",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER29]   = { "hpmcounter29",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_zero },
> > +    [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_zero },
> > +
> > +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   any,    read_zero },
> > +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   any,    read_zero },
> > +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   any,    read_zero },
> > +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   any,    read_zero },
> > +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   any,    read_zero },
> > +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   any,    read_zero },
> > +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   any,    read_zero },
> > +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_zero },
> > +
> > +    [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
> > +    [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
> > +    [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
> > +    [CSR_MHPMEVENT6]     = { "mhpmevent6",     any,    read_zero },
> > +    [CSR_MHPMEVENT7]     = { "mhpmevent7",     any,    read_zero },
> > +    [CSR_MHPMEVENT8]     = { "mhpmevent8",     any,    read_zero },
> > +    [CSR_MHPMEVENT9]     = { "mhpmevent9",     any,    read_zero },
> > +    [CSR_MHPMEVENT10]    = { "mhpmevent10",    any,    read_zero },
> > +    [CSR_MHPMEVENT11]    = { "mhpmevent11",    any,    read_zero },
> > +    [CSR_MHPMEVENT12]    = { "mhpmevent12",    any,    read_zero },
> > +    [CSR_MHPMEVENT13]    = { "mhpmevent13",    any,    read_zero },
> > +    [CSR_MHPMEVENT14]    = { "mhpmevent14",    any,    read_zero },
> > +    [CSR_MHPMEVENT15]    = { "mhpmevent15",    any,    read_zero },
> > +    [CSR_MHPMEVENT16]    = { "mhpmevent16",    any,    read_zero },
> > +    [CSR_MHPMEVENT17]    = { "mhpmevent17",    any,    read_zero },
> > +    [CSR_MHPMEVENT18]    = { "mhpmevent18",    any,    read_zero },
> > +    [CSR_MHPMEVENT19]    = { "mhpmevent19",    any,    read_zero },
> > +    [CSR_MHPMEVENT20]    = { "mhpmevent20",    any,    read_zero },
> > +    [CSR_MHPMEVENT21]    = { "mhpmevent21",    any,    read_zero },
> > +    [CSR_MHPMEVENT22]    = { "mhpmevent22",    any,    read_zero },
> > +    [CSR_MHPMEVENT23]    = { "mhpmevent23",    any,    read_zero },
> > +    [CSR_MHPMEVENT24]    = { "mhpmevent24",    any,    read_zero },
> > +    [CSR_MHPMEVENT25]    = { "mhpmevent25",    any,    read_zero },
> > +    [CSR_MHPMEVENT26]    = { "mhpmevent26",    any,    read_zero },
> > +    [CSR_MHPMEVENT27]    = { "mhpmevent27",    any,    read_zero },
> > +    [CSR_MHPMEVENT28]    = { "mhpmevent28",    any,    read_zero },
> > +    [CSR_MHPMEVENT29]    = { "mhpmevent29",    any,    read_zero },
> > +    [CSR_MHPMEVENT30]    = { "mhpmevent30",    any,    read_zero },
> > +    [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_zero },
> > +
> > +    [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER5H]   = { "hpmcounter5h",   ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER6H]   = { "hpmcounter6h",   ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER7H]   = { "hpmcounter7h",   ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER8H]   = { "hpmcounter8h",   ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER9H]   = { "hpmcounter9h",   ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER10H]  = { "hpmcounter10h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER11H]  = { "hpmcounter11h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER12H]  = { "hpmcounter12h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER13H]  = { "hpmcounter13h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER14H]  = { "hpmcounter14h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER15H]  = { "hpmcounter15h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER16H]  = { "hpmcounter16h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER17H]  = { "hpmcounter17h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER18H]  = { "hpmcounter18h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER19H]  = { "hpmcounter19h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER20H]  = { "hpmcounter20h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER21H]  = { "hpmcounter21h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER22H]  = { "hpmcounter22h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER23H]  = { "hpmcounter23h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER24H]  = { "hpmcounter24h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER25H]  = { "hpmcounter25h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER26H]  = { "hpmcounter26h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER27H]  = { "hpmcounter27h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER28H]  = { "hpmcounter28h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER29H]  = { "hpmcounter29h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER30H]  = { "hpmcounter30h",  ctr32,  read_zero },
> > +    [CSR_HPMCOUNTER31H]  = { "hpmcounter31h",  ctr32,  read_zero },
> > +
> > +    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  any32,  read_zero },
> > +    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  any32,  read_zero },
> > +    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  any32,  read_zero },
> > +    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  any32,  read_zero },
> > +    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  any32,  read_zero },
> > +    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  any32,  read_zero },
> > +    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  any32,  read_zero },
> > +    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32,  read_zero },
> > +    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
> >  #endif /* !CONFIG_USER_ONLY */
> >  };
> > --
> > 2.7.4
> >
> >
>

