Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B758D5387E3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:53:58 +0200 (CEST)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlSf-0003Vv-OV
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvlEc-0007Iy-Po
 for qemu-devel@nongnu.org; Mon, 30 May 2022 15:39:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvlEa-0008Jj-Ev
 for qemu-devel@nongnu.org; Mon, 30 May 2022 15:39:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id a10so2484743pju.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 12:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=0cKeDOBF+dDzWeKdWapccONDVkOHpuiY7pxrNuDTNGg=;
 b=PaUNNuHEZDg0hbQG1R6/RdpvRA9cDN+zIYgXae6dHpVTfvN01CR+ryCgSQSBaMqKUg
 r0gyIJro4NSj670l381RV/pBmP9ehgpkmcDoc+tNvnC8UHJgopO4gfbq+W1qscqzYpsq
 6jHk+ISwkkDqU2itRwLE9UK4+owlVG2gu7Rbrr8PaIZJn1rsKFt4KZOKYxeOESDTHlUL
 40rDLkxt22XmppA+1HiMphEcRYBShfU9gCxf2BeVRzzepMpo4Ab7x7xEPDkTIul3Iwf/
 oNW3D6IfDGSdXOUVMwYE9HHMreoEzvHrtK/dfgo3e/bWVAXUiJxGKUsR4ZPyJ5ikHh8P
 xCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0cKeDOBF+dDzWeKdWapccONDVkOHpuiY7pxrNuDTNGg=;
 b=YcDLankecXU7zpjg43EWJM2LARPygZ0uzDYO9UiFa0AuTdNKfrvNsH9bk5WTmVATLi
 whwn6V6xObMkv8uaPw8I3dKNu1Q+jviC/rRh4yUgvWsWbJXSF8a7+YkHXCwG74fh1l3S
 eGMbBKkRnhxm0SN3Ru1byfhKZR52HKsT+IwaBvDzdQP02x97uNaCWQcMMVe40676Dgt/
 kxgRoJ94pn2+8if0zkup348qCn3+IxuTf3zTfNVm2i6e7/fb+cPu89orjxpRdqJ49BF+
 m5WIZzWmTHw4SjqpI40svLiawZ6ZUoLsmae3mKpu7IrQgRB/04Ye7RsyyxaULJYo/4TP
 nMfQ==
X-Gm-Message-State: AOAM533iTjfWWqtySU/5xjPl6g2sIxss/2kip1/n9Ka9Isl/BphYj7Sg
 jm3+RU5yrhAZN/umPazWyzvdsDEfIPgJIA==
X-Google-Smtp-Source: ABdhPJyJzbq6yPJyBIxE49DawCizjVg42cD58DUcIjlX+JXx8QCi6NA/VpHBLh2oFZaGAYkkvJ1K2Q==
X-Received: by 2002:a17:90b:4ace:b0:1df:cb33:5e7e with SMTP id
 mh14-20020a17090b4ace00b001dfcb335e7emr24349163pjb.5.1653939562323; 
 Mon, 30 May 2022 12:39:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:feab:28bd:b064:f797?
 ([2602:ae:1547:e101:feab:28bd:b064:f797])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a170902a50400b0016168e90f2dsm9432265plq.219.2022.05.30.12.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 12:39:21 -0700 (PDT)
Message-ID: <216ae952-cf52-255a-31c3-4573b5019f36@linaro.org>
Date: Mon, 30 May 2022 12:39:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 000/117] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220530160708.726466-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/22 09:05, Peter Maydell wrote:
> Massive pullreq but almost all of that is RTH's SVE
> refactoring patchset. The other interesting thing here is
> the fix for compiling on aarch64 macos.
> 
> thanks
> -- PMM
> 
> The following changes since commit f7a1ea403e0282a7f57edd4298c4f65f24165da5:
> 
>    Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-29 16:34:56 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220530
> 
> for you to fetch changes up to b1071174d2a2ab371082b7d4b5f19e98edc61ac6:
> 
>    target/arm: Remove aa64_sve check from before disas_sve (2022-05-30 17:05:12 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * docs/system/arm: Add FEAT_HCX to list of emulated features
>   * target/arm/hvf: Include missing "cpregs.h"
>   * hw/sd/allwinner-sdhost: report FIFO water level as 1 when data ready
>   * SVE: refactor to use TRANS/TRANS_FEAT macros and push
>     SVE feature check down to individual insn level

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Icenowy Zheng (1):
>        hw/sd/allwinner-sdhost: report FIFO water level as 1 when data ready
> 
> Peter Maydell (1):
>        docs/system/arm: Add FEAT_HCX to list of emulated features
> 
> Philippe Mathieu-Daudé (1):
>        target/arm/hvf: Include missing "cpregs.h"
> 
> Richard Henderson (114):
>        target/arm: Introduce TRANS, TRANS_FEAT
>        target/arm: Move null function and sve check into gen_gvec_ool_zz
>        target/arm: Use TRANS_FEAT for gen_gvec_ool_zz
>        target/arm: Move null function and sve check into gen_gvec_ool_zzz
>        target/arm: Introduce gen_gvec_ool_arg_zzz
>        target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzz
>        target/arm: Use TRANS_FEAT for do_sve2_zzz_ool
>        target/arm: Move null function and sve check into gen_gvec_ool_zzzz
>        target/arm: Use TRANS_FEAT for gen_gvec_ool_zzzz
>        target/arm: Introduce gen_gvec_ool_arg_zzzz
>        target/arm: Use TRANS_FEAT for do_sve2_zzzz_ool
>        target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzzz
>        target/arm: Rename do_zzxz_ool to gen_gvec_ool_arg_zzxz
>        target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzxz
>        target/arm: Use TRANS_FEAT for do_sve2_zzz_data
>        target/arm: Use TRANS_FEAT for do_sve2_zzzz_data
>        target/arm: Use TRANS_FEAT for do_sve2_zzw_data
>        target/arm: Use TRANS_FEAT for USDOT_zzzz
>        target/arm: Move null function and sve check into gen_gvec_ool_zzp
>        target/arm: Introduce gen_gvec_ool_arg_zpz
>        target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpz
>        target/arm: Use TRANS_FEAT for do_sve2_zpz_data
>        target/arm: Rename do_zpzi_ool to gen_gvec_ool_arg_zpzi
>        target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzi
>        target/arm: Move null function and sve check into gen_gvec_ool_zzzp
>        target/arm: Introduce gen_gvec_ool_arg_zpzz
>        target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzz
>        target/arm: Use TRANS_FEAT for do_sve2_zpzz_ool
>        target/arm: Merge gen_gvec_fn_zz into do_mov_z
>        target/arm: Move null function and sve check into gen_gvec_fn_zzz
>        target/arm: Rename do_zzz_fn to gen_gvec_fn_arg_zzz
>        target/arm: More use of gen_gvec_fn_arg_zzz
>        target/arm: Use TRANS_FEAT for gen_gvec_fn_arg_zzz
>        target/arm: Use TRANS_FEAT for do_sve2_fn_zzz
>        target/arm: Use TRANS_FEAT for RAX1
>        target/arm: Introduce gen_gvec_fn_arg_zzzz
>        target/arm: Use TRANS_FEAT for do_sve2_zzzz_fn
>        target/arm: Introduce gen_gvec_fn_zzi
>        target/arm: Use TRANS_FEAT for do_zz_dbm
>        target/arm: Hoist sve access check through do_sel_z
>        target/arm: Introduce gen_gvec_fn_arg_zzi
>        target/arm: Use TRANS_FEAT for do_sve2_fn2i
>        target/arm: Use TRANS_FEAT for do_vpz_ool
>        target/arm: Use TRANS_FEAT for do_shift_imm
>        target/arm: Introduce do_shift_zpzi
>        target/arm: Use TRANS_FEAT for do_shift_zpzi
>        target/arm: Use TRANS_FEAT for do_zpzzz_ool
>        target/arm: Move sve check into do_index
>        target/arm: Use TRANS_FEAT for do_index
>        target/arm: Use TRANS_FEAT for do_adr
>        target/arm: Use TRANS_FEAT for do_predset
>        target/arm: Use TRANS_FEAT for RDFFR, WRFFR
>        target/arm: Use TRANS_FEAT for do_pfirst_pnext
>        target/arm: Use TRANS_FEAT for do_EXT
>        target/arm: Use TRANS_FEAT for do_perm_pred3
>        target/arm: Use TRANS_FEAT for do_perm_pred2
>        target/arm: Move sve zip high_ofs into simd_data
>        target/arm: Use gen_gvec_ool_arg_zzz for do_zip, do_zip_q
>        target/arm: Use TRANS_FEAT for do_zip, do_zip_q
>        target/arm: Use TRANS_FEAT for do_clast_vector
>        target/arm: Use TRANS_FEAT for do_clast_fp
>        target/arm: Use TRANS_FEAT for do_clast_general
>        target/arm: Use TRANS_FEAT for do_last_fp
>        target/arm: Use TRANS_FEAT for do_last_general
>        target/arm: Use TRANS_FEAT for SPLICE
>        target/arm: Use TRANS_FEAT for do_ppzz_flags
>        target/arm: Use TRANS_FEAT for do_sve2_ppzz_flags
>        target/arm: Use TRANS_FEAT for do_ppzi_flags
>        target/arm: Use TRANS_FEAT for do_brk2, do_brk3
>        target/arm: Use TRANS_FEAT for MUL_zzi
>        target/arm: Reject dup_i w/ shifted byte early
>        target/arm: Reject add/sub w/ shifted byte early
>        target/arm: Reject copy w/ shifted byte early
>        target/arm: Use TRANS_FEAT for ADD_zzi
>        target/arm: Use TRANS_FEAT for do_zzi_sat
>        target/arm: Use TRANS_FEAT for do_zzi_ool
>        target/arm: Introduce gen_gvec_{ptr,fpst}_zzzz
>        target/arm: Use TRANS_FEAT for FMMLA
>        target/arm: Move sve check into gen_gvec_fn_ppp
>        target/arm: Implement NOT (prediates) alias
>        target/arm: Use TRANS_FEAT for SEL_zpzz
>        target/arm: Use TRANS_FEAT for MOVPRFX
>        target/arm: Use TRANS_FEAT for FMLA
>        target/arm: Use TRANS_FEAT for BFMLA
>        target/arm: Rename do_zzz_fp to gen_gvec_ool_fpst_arg_zzz
>        target/arm: Use TRANS_FEAT for DO_FP3
>        target/arm: Use TRANS_FEAT for FMUL_zzx
>        target/arm: Use TRANS_FEAT for FTMAD
>        target/arm: Move null function and sve check into do_reduce
>        target/arm: Use TRANS_FEAT for do_reduce
>        target/arm: Use TRANS_FEAT for FRECPE, FRSQRTE
>        target/arm: Expand frint_fns for MO_8
>        target/arm: Rename do_zpz_ptr to gen_gvec_ool_fpst_arg_zpz
>        target/arm: Move null function and sve check into do_frint_mode
>        target/arm: Use TRANS_FEAT for do_frint_mode
>        target/arm: Use TRANS_FEAT for FLOGB
>        target/arm: Use TRANS_FEAT for do_ppz_fp
>        target/arm: Rename do_zpzz_ptr to gen_gvec_fpst_arg_zpzz
>        target/arm: Use TRANS_FEAT for gen_gvec_fpst_arg_zpzz
>        target/arm: Use TRANS_FEAT for FCADD
>        target/arm: Introduce gen_gvec_fpst_zzzzp
>        target/arm: Use TRANS_FEAT for gen_gvec_fpst_zzzzp
>        target/arm: Move null function and sve check into do_fp_imm
>        target/arm: Use TRANS_FEAT for DO_FP_IMM
>        target/arm: Use TRANS_FEAT for DO_FPCMP
>        target/arm: Remove assert in trans_FCMLA_zzxz
>        target/arm: Use TRANS_FEAT for FCMLA_zzxz
>        target/arm: Use TRANS_FEAT for do_narrow_extract
>        target/arm: Use TRANS_FEAT for do_shll_tb
>        target/arm: Use TRANS_FEAT for do_shr_narrow
>        target/arm: Use TRANS_FEAT for do_FMLAL_zzzw
>        target/arm: Use TRANS_FEAT for do_FMLAL_zzxw
>        target/arm: Add sve feature check for remaining trans_* functions
>        target/arm: Remove aa64_sve check from before disas_sve
> 
>   docs/system/arm/emulation.rst |    1 +
>   target/arm/translate.h        |   11 +
>   target/arm/sve.decode         |   57 +-
>   hw/sd/allwinner-sdhost.c      |    7 +
>   target/arm/hvf/hvf.c          |    1 +
>   target/arm/sve_helper.c       |    6 +-
>   target/arm/translate-a64.c    |    2 +-
>   target/arm/translate-sve.c    | 5367 +++++++++++++++--------------------------
>   8 files changed, 2067 insertions(+), 3385 deletions(-)
> 


