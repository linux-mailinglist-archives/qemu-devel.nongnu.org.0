Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190F1E3D4D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 11:13:01 +0200 (CEST)
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jds7Q-0005Tf-0m
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 05:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jds6W-00053s-Nc
 for qemu-devel@nongnu.org; Wed, 27 May 2020 05:12:04 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jds6U-0005GD-Le
 for qemu-devel@nongnu.org; Wed, 27 May 2020 05:12:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id h4so2313579wmb.4
 for <qemu-devel@nongnu.org>; Wed, 27 May 2020 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=mZow7RQ3uNc/fOilqH1nl0tQUuXD+nGtJtXzvmxT8bw=;
 b=mNOn3xJMgOIAu2sCmsH2p/cwqcU1/DvJ9n2Pmhk15xRMeLaKoVGYyNISbNwzbnCZLM
 IQN08fqnOp5Sn3POH6cSAGShhpy0O6tjDLTZdMfDHVWebud1xS1WFPDDTgSrzHJjXtkX
 7/E7gEAYfLznF/6psiWU12ohXW0duYn7+IentLWa721gejUpljNT8Y0dSc4KeQiyXbgv
 sgh+rD3BgoE7jzXrPa9rilOrca5kmLhSjAzkZ4ruPfqZzT+sk9W+eTAk0bZru0cLKdlX
 nXP+XYeXQ5kHibFMakeYHN+Ee85q07ZywqludCoj0v9HaJWEsAWPe9dABa5cI1e2GEj/
 4cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=mZow7RQ3uNc/fOilqH1nl0tQUuXD+nGtJtXzvmxT8bw=;
 b=lwdDVt3kiR+/5ITTWEo210UUi4lmL5r7YSXrk25p4w/yk3aiaAuw0hsBi2PDBGASOh
 x7HfN/B1CGnkpxbSk1aoF7sQ3UokVuU9EjarnfiWs1liW+dfiYofIPVnyO+fHq2FnibM
 a0PSUXCKWIseLUsWM9R5OgPznH58bhvoqCv+sroVOPHRDJNqLLRNj0qtwJMyERTsaNuD
 rbrwEY+GKKd9LxwGILDba7n3lso/khLP/pF1IxvBvD67aUNVt5BvVz9Pjo92pNGWDt0a
 jctKHST3p34ck5yv1Zn4RUAwgQLGxruk/pTspe7mf0kj6CVKM9WwOUdzvmXUhXe2EPwN
 gHAQ==
X-Gm-Message-State: AOAM532nJ8C6uxC7Mlr7QnOVEeQRrDSHUCXhToVOg/70toZ9Xc1wJZOx
 WjcFp0G+i66aASblgk41Sq3KYynRTZ4=
X-Google-Smtp-Source: ABdhPJxQA7C2VJZxJctsw/3cI5Uc40E+wRjNclJtBfKSjW3VeJOFes0ihGNQO8F3+KB8Mv4pBX4xLg==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr3418903wml.48.1590570719636; 
 Wed, 27 May 2020 02:11:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 10sm2198077wmw.26.2020.05.27.02.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 02:11:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 492851FF7E;
 Wed, 27 May 2020 10:11:57 +0100 (BST)
References: <tencent_86D9DB902C46CBAC4F3A6FD5B4CDA93B7506@qq.com>
User-agent: mu4e 1.5.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: casmac <1482995675@qq.com>
Subject: Re: GDB get wrong debug infos on TI DSP architecture extension
In-reply-to: <tencent_86D9DB902C46CBAC4F3A6FD5B4CDA93B7506@qq.com>
Date: Wed, 27 May 2020 10:11:57 +0100
Message-ID: <87a71t7ndu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


casmac <1482995675@qq.com> writes:

> Hi all,
> &nbsp;&nbsp; I am working on a TI DSP architecture extension for QEMU. No=
w, we are adding GDB debugging features.=20
> &nbsp;&nbsp; We have done the following, but not sure we are on the right=
 track :
> &nbsp;&nbsp; - add a xml description file in gdb-xml, without
> understanding the purpose of the file, why some architectures don't
> provide such xml file?

XML descriptions are an extension to the GDB protocol which avoids
having to have knowledge baked into GDB itself. The older well supported
architectures don't need to send them for their base config as GDB
already knows what they should have. However most extensions are
reported as XML.

You may well need to have logic in your target code which decides which
XML variant to send.

> &nbsp;&nbsp; - add ***_cpu_gdb_read_register(), ***_cpu_gdb_write_registe=
r();
> &nbsp;&nbsp; - added&nbsp; dsp_cpu_get_phys_page_attrs_debug(), but uncer=
tain about what to return
> &nbsp; &nbsp;&nbsp; dsp_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr=
 addr, MemTxAttrs *attrs)=20
> &nbsp; &nbsp;&nbsp; {
> &nbsp; &nbsp; &nbsp; &nbsp; return addr &amp; TARGET_PAGE_MASK;&nbsp;&nbs=
p;
> &nbsp; &nbsp;&nbsp; }
> &nbsp;&nbsp;=20
> &nbsp;&nbsp; We run QEMU with the these arguments
> &nbsp;&nbsp; qemu-system-dsp ... -kernel filename.out -S -s
> &nbsp;&nbsp;=20
> &nbsp;&nbsp; It turns out that gdb reads incorrect register values,
> and complains : "warning: Target-supplied registers are not supported
> by the current architecture".

> <feature name=3D"org.gnu.gdb.tic3x.core"&gt;

Does this match something in gdb?

--=20
Alex Benn=C3=A9e

