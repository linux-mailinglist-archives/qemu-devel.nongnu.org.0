Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF532249B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 04:23:59 +0100 (CET)
Received: from localhost ([::1]:34828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEOIo-00082f-Dw
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 22:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lEOI0-0007cm-M2
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 22:23:08 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lEOHy-0001hq-DF
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 22:23:08 -0500
Received: by mail-pf1-x430.google.com with SMTP id q20so7906153pfu.8
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 19:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=cM912ElSbEnONaB2LnB0Nv6OpxFH4i0/1HVfdpaNpY8=;
 b=b4d0cm7hkKVINHwLJCwsdiOkchqjj595BNkiLzaMaLexd3IxpbCdJSaQLu6kHyFe+W
 Bfj9wd5P+BQC0k0gabkOKehVZVrSiDBCO//LMM0AHJIJ2/hdI2QfkALKZQ6WdH+u3AmV
 7iV7d4AQx0sZOZyt5NxBP34JQgjmyOkDz9RiCQ6dyLZwuijMTZp5lkHG2Ot0AbjCntCJ
 CcBZeE50uepyb1+Xs13FB5OVKxOGGJDKf1yraXA/vaTypwBAZb3NnU2ogp7mGRMCYc+x
 lEEA44k447FxFfd1LMmveMN7gzzmYDNNo3Tt+PO1835lyisSqFPumOoc4RbPz5ZjQNnt
 lk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=cM912ElSbEnONaB2LnB0Nv6OpxFH4i0/1HVfdpaNpY8=;
 b=gZo0f/KFjf2s42FiCDvd21q9M0qb84KjfDGCFjwP+4kEk2C4CpjF+uujo/6RcH9CIb
 j2ELhmFc3zKg2duwCeKG2HNMYQ3rwqiGGgewLLhMMQoGhSM8MOgFNUUisjW8wnz+9XjA
 SPBtKI2ByUBRTX6hWZ33iTJot7xNBPUQ57Sav3RDVCuB1tpQfR6BAuxwTu+rnUtvkPDK
 WjPYllYawaQYmYbeHUaKwugRhOQbS5hPHHM295mDA1oL9FX62lFllbrbuWwOjEMh1GMH
 Bjwp3xgy8L6XEoEfvNhqHHKNGAt0qXHJF++f/PgmdPMZcIHjqAaUk9FmtkCUzyowiL5C
 w+cw==
X-Gm-Message-State: AOAM532ycGaZJAqF9pArxIXJDtLrpwNhqcG74tAqEGbJ+3M1Ym3Vc5cA
 nOD0XvtKhEj7AAUXI+8OELk=
X-Google-Smtp-Source: ABdhPJx4pbCN+FlBi6x4ZQDEoRd7U6TRRM1VjdRM15KAGRnEAwhX0I37KHAiGQ4uiPZNSD/sdFUqEg==
X-Received: by 2002:a63:66c7:: with SMTP id
 a190mr22422890pgc.117.1614050584040; 
 Mon, 22 Feb 2021 19:23:04 -0800 (PST)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id c29sm12962672pgb.58.2021.02.22.19.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 19:23:03 -0800 (PST)
Date: Mon, 22 Feb 2021 19:23:01 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 02/23] kvm: Switch KVM_CAP_READONLY_MEM to a per-VM
 ioctl()
Message-ID: <20210223032301.GA88084@private.email.ne.jp>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
 <1c93f5dabe2ef573302ff362c0c6c525bbe8af43.1613188118.git.isaku.yamahata@intel.com>
 <0f29a789-9822-3dd8-b827-e5b86b933059@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f29a789-9822-3dd8-b827-e5b86b933059@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, cohuck@redhat.com,
 ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com,
 alistair@alistair23.me, xiaoyao.li@intel.com, qemu-devel@nongnu.org,
 mtosatti@redhat.com, pbonzini@redhat.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 08:56:45AM +0100,
Philippe Mathieu-Daudé <philmd@redhat.com> wrote:

> Hi Isaku,
> 
> On 2/16/21 3:12 AM, Isaku Yamahata wrote:
> > Switch to making a VM ioctl() call for KVM_CAP_READONLY_MEM, which may
> > be conditional on VM type in recent versions of KVM, e.g. when TDX is
> > supported.
> > 
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > ---
> >  accel/kvm/kvm-all.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index 47516913b7..351c25a5cb 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -2164,7 +2164,7 @@ static int kvm_init(MachineState *ms)
> >      }
> >  
> >      kvm_readonly_mem_allowed =
> > -        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
> > +        (kvm_vm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
> 
> Can this check with "recent KVM" be a problem with older ones?
> 
> Maybe for backward compatibility we need:
> 
>           = (kvm_vm_check_extension(s, KVM_CAP_READONLY_MEM) > 0) ||
>             (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);

Agreed. That's safer and it's difficult to check the very old version of kenel
and non-x86 arch.

Thanks,

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

