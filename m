Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5BD415790
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 06:28:04 +0200 (CEST)
Received: from localhost ([::1]:48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTGL4-0006jt-Br
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 00:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTGK0-00064V-4a
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 00:26:56 -0400
Received: from [115.28.160.31] (port=46738 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTGJw-00032o-Da
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 00:26:55 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8AC2460184;
 Thu, 23 Sep 2021 12:26:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632371205; bh=R2F9OIDgmZVS5ICbmRq2+t1LvmIzkbgXrZnjbeoMrpk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YP1NFgyJWdbpAitYyTpjTu5uFHAxXI7iifP1/GnZbLReo5Vxa5PXgQo5HZsAYAhVX
 TEJ7xlQhLEnOSsT+S+psStn7HSYu91LRegSe1zqmX+Qk0ECgJ1nw7HoSPjavjAgKsD
 2r05Kl0gzBGz7Ve/kSqNrcv/4+gmPMuVzdhM4x5w=
Message-ID: <f2e3705c-fd39-b2ca-8594-ed853a563552@xen0n.name>
Date: Thu, 23 Sep 2021 12:26:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v6 00/21] Add LoongArch linux-user emulation support
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>
References: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
 <5d524802-1083-7280-97a7-9cd80037d5a3@linaro.org>
 <77e2f5b9-ff55-aad4-77dc-13a5547717b1@loongson.cn>
 <4873b569-fb74-177d-8888-2964c636d14e@xen0n.name>
 <3eda6317.876e.17c10a0dc88.Coremail.gaosong@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <3eda6317.876e.17c10a0dc88.Coremail.gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 maobibo@loongson.cn, alex.bennee@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 peterx@redhat.com, pbonzini@redhat.com, bmeng.cn@gmail.com, philmd@redhat.com,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Song,

On 9/23/21 11:09, gaosong wrote:
> > 
> > - How would you provide the necessary firmware bits? Ideally that would 
> > be some open-source reference implementation so people would be able to 
> > collaborate on that front, and to maybe customize for specialized needs 
> > (e.g. ultra-dense cloud use cases like with Firecracker).
> > 
>
> On QEMU, we only support 64 bit, So far, we have no plan to support 32 bit.
IMO it's fine to not support 32-bit for now.
> As far as I know, LoongArch BIOS is planning to open source.
And that's exciting to hear! Really looking forward to that.
> > - How is old/new kernel ABI affecting your system-level emulation 
> > compatibility? IIUC the underlying ISA and chip behavior should be the 
> > same, only difference would be the firmware-kernel ABI, but again it 
> > should be just a matter of substituting the right image.
> >
>
> We only supoort the lastet kernel [1].
>
> [1] https://github.com/loongson/linux/tree/loongarch-next
I may formed the question ambiguously; I'm actually interested in what 
kernel flavor qemu will support emulating, not what qemu runs on. IIUC 
qemu will compile and run fine on both old-world and new-world systems. 
But anyway, we'll find out when your code is out for review.
> > - Would the resulting work support emulating both old-world and 
> > new-world systems? AFAIK those commercial distros who're VERY early 
> > adopters of LoongArch are given similarly early toolchains/kernels. They 
> > belong to the old-world as a result, and are very likely to be stuck on 
> > the old-world ABI for whole major versions before migrating, if at all 
> > possible. Closed-source/commercial software also risk being available 
> > only for the old-world, and it would be extremely important to provide 
> > some degree of interoperability so that we don't split the ecosystem.
>
> On the basis of supporting the latest kernel, we will try to be compatible with the old version of LoongArch.
> But the result may be incompatible。
Thanks for the clarification. Indeed focusing on new-world should be the 
right way to go, adding old-world compatibility later if possible. I 
fear adding compatibility too early would result in a franken-port not 
serving either world well nor maintainable.

