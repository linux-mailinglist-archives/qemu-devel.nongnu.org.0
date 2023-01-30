Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D19D68059D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:26:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMgg-0002xJ-QK; Mon, 30 Jan 2023 00:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ClXXYwsKCjcTVdXkeXrmgZZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--ackerleytng.bounces.google.com>)
 id 1pMMgf-0002xB-NZ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:26:37 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ClXXYwsKCjcTVdXkeXrmgZZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--ackerleytng.bounces.google.com>)
 id 1pMMge-0003TF-51
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:26:37 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 k15-20020a5b0a0f000000b007eba3f8e3baso11780591ybq.4
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=b/vIkIPl5nRj/3hPy3c/U0PXxxrhFi67btaNOzIv4hA=;
 b=D7SxTMVpdE8OPU4Q8lhHRcsgMpDnY1lwmr2KK3l7i/bP6j+o5A3rsWdRpR2th82Tw7
 3Na5KNK1Stogf6axURA9XxIaCe3/IFgJehhOLeBTGm9/p382ok+02Xo2ovXAwG+kGbvD
 BmYmXY5hlLXG+XKrP7NNkk58y3fUL7ev3IABImxVQG/7/RdSHdFyuSpnpPb537H0OIPo
 ixo6e9FQ/K1A5UG1StdJkIVOHUhcREtuoRy1Ik+eIze4N8mllpTjrSq6abcsckZ7nOZ/
 sLroSxpo5sn2CdacRJ1G0xOA8ivhouUqU9Hqwci7GILS79bIuTqIG+D9QA2CHtpK2oXX
 ScUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b/vIkIPl5nRj/3hPy3c/U0PXxxrhFi67btaNOzIv4hA=;
 b=ALbM5fRkrS0Asnbh8HKGfB0cXw5YgJhIwwebey+wK+7z0VApN59QYea4CtpbU5kqlm
 AJTAli11aKXZEV6DN3j9iOgfGEpJPHriRjIrs29AzVSmoFwF+VMdskCJB+tdsimVqQON
 mTTHBbHLS+/VtpCqoTqRS4Coi6836KDBzFLv/OhMe1slj+oDiaSlGvwNkIJ8j+iIK4S3
 iHBvZaUWQZgk4vtd6Ofr3YYG6+VPGyYcsRFF7boFAr2cHB+fZsaSu8gk+nvNaGGa4ZvW
 lMrzuXKrCR2HNhYoL9QH5AgDFmtoeKzZGK4NmzxoqQ0f7MrfNUrhhHuXB31CGk+Msiv2
 A+6Q==
X-Gm-Message-State: AO0yUKWVKRTHE+z6n2SEreOveBkoS6bydwtWtRqMs1Bxf08if+jiUby+
 XXFB3O8i8cMWloyrW7jtOQIRFfe3X8UXE5qABQ==
X-Google-Smtp-Source: AK7set+JlXdd4+lvDMPsWLbQWxCgCdL1TWQEwkw9Zl36rvKxocVcw2BCVuEm0lbxbrZEdORCPWSOnhc/TSAGSF3Dag==
X-Received: from ackerleytng-cloudtop-sg.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:b30])
 (user=ackerleytng job=sendgmr) by 2002:a81:77d6:0:b0:506:348b:88a2 with SMTP
 id s205-20020a8177d6000000b00506348b88a2mr3119463ywc.400.1675056394197; Sun,
 29 Jan 2023 21:26:34 -0800 (PST)
Date: Mon, 30 Jan 2023 05:26:29 +0000
In-Reply-To: <20221202061347.1070246-2-chao.p.peng@linux.intel.com> (message
 from Chao Peng on Fri,  2 Dec 2022 14:13:39 +0800)
Mime-Version: 1.0
Message-ID: <diqzzga0fv96.fsf@ackerleytng-cloudtop-sg.c.googlers.com>
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
From: Ackerley Tng <ackerleytng@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 pbonzini@redhat.com, corbet@lwn.net, seanjc@google.com, vkuznets@redhat.com, 
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, 
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, arnd@arndb.de, 
 naoya.horiguchi@nec.com, linmiaohe@huawei.com, x86@kernel.org, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, bfields@fieldses.org, 
 akpm@linux-foundation.org, shuah@kernel.org, rppt@kernel.org, 
 steven.price@arm.com, mail@maciej.szmigiero.name, vbabka@suse.cz, 
 vannapurve@google.com, yu.c.zhang@linux.intel.com, 
 chao.p.peng@linux.intel.com, kirill.shutemov@linux.intel.com, luto@kernel.org, 
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com, 
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, qperret@google.com, tabba@google.com, 
 michael.roth@amd.com, mhocko@suse.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3ClXXYwsKCjcTVdXkeXrmgZZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--ackerleytng.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


> +static int restrictedmem_getattr(struct user_namespace *mnt_userns,
> +				 const struct path *path, struct kstat *stat,
> +				 u32 request_mask, unsigned int query_flags)
> +{
> +	struct inode *inode = d_inode(path->dentry);
> +	struct restrictedmem_data *data = inode->i_mapping->private_data;
> +	struct file *memfd = data->memfd;
> +
> +	return memfd->f_inode->i_op->getattr(mnt_userns, path, stat,
> +					     request_mask, query_flags);

Instead of calling shmem's getattr() with path, we should be using the
the memfd's path.

Otherwise, shmem's getattr() will use restrictedmem's inode instead of
shmem's inode. The private fields will be of the wrong type, and the
host will crash when shmem_is_huge() does SHMEM_SB(inode->i_sb)->huge),
since inode->i_sb->s_fs_info is NULL for the restrictedmem's superblock.

Here's the patch:

diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
index 37191cd9eed1..06b72d593bd8 100644
--- a/mm/restrictedmem.c
+++ b/mm/restrictedmem.c
@@ -84,7 +84,7 @@ static int restrictedmem_getattr(struct user_namespace  
*mnt_userns,
  	struct restrictedmem *rm = inode->i_mapping->private_data;
  	struct file *memfd = rm->memfd;

-	return memfd->f_inode->i_op->getattr(mnt_userns, path, stat,
+	return memfd->f_inode->i_op->getattr(mnt_userns, &memfd->f_path, stat,
  					     request_mask, query_flags);
  }

> +}
> +
> +static int restrictedmem_setattr(struct user_namespace *mnt_userns,
> +				 struct dentry *dentry, struct iattr *attr)
> +{
> +	struct inode *inode = d_inode(dentry);
> +	struct restrictedmem_data *data = inode->i_mapping->private_data;
> +	struct file *memfd = data->memfd;
> +	int ret;
> +
> +	if (attr->ia_valid & ATTR_SIZE) {
> +		if (memfd->f_inode->i_size)
> +			return -EPERM;
> +
> +		if (!PAGE_ALIGNED(attr->ia_size))
> +			return -EINVAL;
> +	}
> +
> +	ret = memfd->f_inode->i_op->setattr(mnt_userns,
> +					    file_dentry(memfd), attr);
> +	return ret;
> +}
> +
> +static const struct inode_operations restrictedmem_iops = {
> +	.getattr = restrictedmem_getattr,
> +	.setattr = restrictedmem_setattr,
> +};

