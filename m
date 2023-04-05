Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648CB6D8AAC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 00:33:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkBg9-000853-4t; Wed, 05 Apr 2023 18:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-_YtZAsKCsgoqys5zsC71uu22uzs.q204s08-rs9sz121u18.25u@flex--ackerleytng.bounces.google.com>)
 id 1pkBg7-00084r-Bl
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:32:31 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-_YtZAsKCsgoqys5zsC71uu22uzs.q204s08-rs9sz121u18.25u@flex--ackerleytng.bounces.google.com>)
 id 1pkBg5-0008Pd-Ne
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:32:31 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 f6-20020a170902ce8600b001a25ae310a9so16076047plg.10
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 15:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680733948;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Gu2QsUrLzhWAeLzNTmiDWMuuwgGUJt5zdF3ZUZTfDtU=;
 b=Ic1+NmDLa5hMPtGVT8+HebQhOzm+kEy+BqEiLEtn+OlCuFrgeenhk8Ei5IhgHP7PFO
 eeER4W3YVU7OjGoXtDaRa2v00Q4mA4BRjRKbY+moqn9fUzpd9J3fOLNMEsAQwxZSmFAN
 zEtXNk6jlku/4N0COH2zXWsx/euB+01q00epSAu0jyzLc2/sltspKE3bB6roHqVjtGqg
 VzMHDk3si+DA6W8KXKy+W0gYsfEYxlU1JEAsppztBzx/e3ztJAFLGXUIzmY9i5iBOdlz
 /2zB9ElbSyQs7GT/ZG774asZvNwjHOtnCVfMMPNi5dyMxANZV96RmdxXXumeB8Gon07o
 jqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680733948;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gu2QsUrLzhWAeLzNTmiDWMuuwgGUJt5zdF3ZUZTfDtU=;
 b=ftZQm5eUahJwEi9KsZSuhyQgnUNLwoXS4ZxKs+GWk0Y5ULAnG3jjOklJAuwSSDVvJF
 lzJpY8vzlmm5l3uFbHivJAdqy0fP/Z7kZjBJbsBR8OPkJ7FNNBRFvBL49hS6pKWEJOJQ
 z6JGcHIxSAXWzDdHpZKtGPrkbS2FafMB+U2hxor2QmCAhCAX/tZsRz3F0qvhE3x6p1yp
 lVkfBLikDDcpkLxJ5LYZCVWCaqYEPxasK+mnlL/BEYB6FCOroYxB8dZFuahormEs1asv
 qp65jlUKT/DQwJd7xG9R7hVlK8UBS1nBMKrb9G7Gc7+Z0X+1eAfMoGJwFueF6ioOIO2p
 K79A==
X-Gm-Message-State: AAQBX9euqlz58mSjHMt6sHcGYEiE/pGDZyA5TwMPUcOukrtHa7c/SMzA
 J7qol8veip5rQeDZdTpovmfZpe3994TfFfdJrg==
X-Google-Smtp-Source: AKy350bu8kP+l7JHrBlhgnLqNucEG6rtKm9issrnydB2heDAMrKaEZaVtTKV56Xmq1ks6MtG/TvZQI0fxIJ6Cse1xA==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a05:6a00:2313:b0:593:fcfb:208b with
 SMTP id h19-20020a056a00231300b00593fcfb208bmr4149900pfh.3.1680733947764;
 Wed, 05 Apr 2023 15:32:27 -0700 (PDT)
Date: Wed, 05 Apr 2023 22:32:26 +0000
In-Reply-To: <20230404082507.sbyfahwc4gdupmya@box.shutemov.name>
 (kirill@shutemov.name)
Mime-Version: 1.0
Message-ID: <diqzfs9e0xl1.fsf@ackerleytng-cloudtop.c.googlers.com>
Subject: Re: [RFC PATCH v3 1/2] mm: restrictedmem: Allow userspace to specify
 mount for memfd_restricted
From: Ackerley Tng <ackerleytng@google.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org, 
 aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com, 
 david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, 
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com, 
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com, 
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org, seanjc@google.com, 
 shuah@kernel.org, steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3-_YtZAsKCsgoqys5zsC71uu22uzs.q204s08-rs9sz121u18.25u@flex--ackerleytng.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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


Thanks for reviewing these patches!

"Kirill A. Shutemov" <kirill@shutemov.name> writes:

> On Fri, Mar 31, 2023 at 11:50:39PM +0000, Ackerley Tng wrote:

>> ...

>> +static int restrictedmem_create_on_user_mount(int mount_fd)
>> +{
>> +	int ret;
>> +	struct fd f;
>> +	struct vfsmount *mnt;
>> +
>> +	f = fdget_raw(mount_fd);
>> +	if (!f.file)
>> +		return -EBADF;
>> +
>> +	ret = -EINVAL;
>> +	if (!is_mount_root(f.file))
>> +		goto out;
>> +
>> +	mnt = f.file->f_path.mnt;
>> +	if (!is_shmem_mount(mnt))
>> +		goto out;
>> +
>> +	ret = file_permission(f.file, MAY_WRITE | MAY_EXEC);

> Why MAY_EXEC?


Christian pointed out that this check does not make sense, I'll be
removing the entire check in the next revision.

>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = mnt_want_write(mnt);
>> +	if (unlikely(ret))
>> +		goto out;
>> +
>> +	ret = restrictedmem_create(mnt);
>> +
>> +	mnt_drop_write(mnt);
>> +out:
>> +	fdput(f);
>> +
>> +	return ret;
>> +}

> We need review from fs folks. Look mostly sensible, but I have no
> experience in fs.

>> +
>> +SYSCALL_DEFINE2(memfd_restricted, unsigned int, flags, int, mount_fd)
>> +{
>> +	if (flags & ~RMFD_USERMNT)
>> +		return -EINVAL;
>> +
>> +	if (flags == RMFD_USERMNT) {
>> +		if (mount_fd < 0)
>> +			return -EINVAL;
>> +
>> +		return restrictedmem_create_on_user_mount(mount_fd);
>> +	} else {
>> +		return restrictedmem_create(NULL);
>> +	}

> Maybe restructure with single restrictedmem_create() call?

> 	struct vfsmount *mnt = NULL;

> 	if (flags == RMFD_USERMNT) {
> 		...
> 		mnt = ...();
> 	}

> 	return restrictedmem_create(mnt);

Will do so in the next revision.

>> +}
>> +
>>   int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
>>   		       struct restrictedmem_notifier *notifier, bool exclusive)
>>   {
>> --
>> 2.40.0.348.gf938b09366-goog

