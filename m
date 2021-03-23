Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2931345EAC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:57:26 +0100 (CET)
Received: from localhost ([::1]:53374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgb8-0005zv-3K
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1lOga1-0004fB-MO
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:56:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:52636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1lOgZy-0004sN-OS
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:56:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3619619B8;
 Tue, 23 Mar 2021 12:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616504168;
 bh=7s1M3IsLZtGNlNk01+JyIT7SNm9jTdPqx5b5zByfRyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tqiQf2egd3FRlPC2gMcFNgwmVFU3j04Mp9W/SwOUfQEhucaofggWeqoSZp0n6DqYZ
 +LtxhrvTSCsggPocaQmVxpynR6Y7NV9YgJ0BgXkICEr8DRsmwjHwqXP09gL80dqcvY
 eJYg+ci/qtpPxMSC/jhvbWq/4QqFr3hBu7D9VRe8=
Date: Tue, 23 Mar 2021 13:56:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v8] drivers/misc: sysgenid: add system generation id driver
Message-ID: <YFnlZQZOasOwxUDn@kroah.com>
References: <1615213083-29869-1-git-send-email-acatan@amazon.com>
 <YEY2b1QU5RxozL0r@kroah.com>
 <a61c976f-b362-bb60-50a5-04073360e702@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61c976f-b362-bb60-50a5-04073360e702@amazon.com>
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=gregkh@linuxfoundation.org; helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Jason@zx2c4.com, areber@redhat.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, ghammer@redhat.com, vijaysun@ca.ibm.com,
 0x7f454c46@gmail.com, qemu-devel@nongnu.org, mhocko@kernel.org,
 dgunigun@redhat.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au, mst@redhat.com,
 ebiggers@kernel.org, borntraeger@de.ibm.com, sblbir@amazon.com,
 bonzini@gnu.org, arnd@arndb.de, jannh@google.com, raduweis@amazon.com,
 asmehra@redhat.com, Adrian Catangiu <acatan@amazon.com>, rppt@kernel.org,
 luto@kernel.org, gil@azul.com, oridgar@gmail.com, colmmacc@amazon.com,
 tytso@mit.edu, ovzxemul@gmail.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, ebiederm@xmission.com, rafael@kernel.org,
 w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 05:03:58PM +0100, Alexander Graf wrote:
> 
> 
> On 08.03.21 15:36, Greg KH wrote:
> > 
> > On Mon, Mar 08, 2021 at 04:18:03PM +0200, Adrian Catangiu wrote:
> > > +static struct miscdevice sysgenid_misc = {
> > > +     .minor = MISC_DYNAMIC_MINOR,
> > > +     .name = "sysgenid",
> > > +     .fops = &fops,
> > > +};
> > 
> > Much cleaner, but:
> > 
> > > +static int __init sysgenid_init(void)
> > > +{
> > > +     int ret;
> > > +
> > > +     sysgenid_data.map_buf = get_zeroed_page(GFP_KERNEL);
> > > +     if (!sysgenid_data.map_buf)
> > > +             return -ENOMEM;
> > > +
> > > +     atomic_set(&sysgenid_data.generation_counter, 0);
> > > +     atomic_set(&sysgenid_data.outdated_watchers, 0);
> > > +     init_waitqueue_head(&sysgenid_data.read_waitq);
> > > +     init_waitqueue_head(&sysgenid_data.outdated_waitq);
> > > +     spin_lock_init(&sysgenid_data.lock);
> > > +
> > > +     ret = misc_register(&sysgenid_misc);
> > > +     if (ret < 0) {
> > > +             pr_err("misc_register() failed for sysgenid\n");
> > > +             goto err;
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +err:
> > > +     free_pages(sysgenid_data.map_buf, 0);
> > > +     sysgenid_data.map_buf = 0;
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void __exit sysgenid_exit(void)
> > > +{
> > > +     misc_deregister(&sysgenid_misc);
> > > +     free_pages(sysgenid_data.map_buf, 0);
> > > +     sysgenid_data.map_buf = 0;
> > > +}
> > > +
> > > +module_init(sysgenid_init);
> > > +module_exit(sysgenid_exit);
> > 
> > So you do this for any bit of hardware that happens to be out there?
> > Will that really work?  You do not have any hwid to trigger off of to
> > know that this is a valid device you can handle?
> 
> The interface is already useful in a pure container context where the
> generation change request is triggered by software.
> 
> And yes, there are hardware triggers, but Michael was quite unhappy about
> potential races between VMGenID change and SysGenID change and thus wanted
> to ideally separate the interfaces. So we went ahead and isolated the
> SysGenID one, as it's already useful as is.
> 
> Hardware drivers to inject change events into SysGenID can then follow
> later, for all different hardware platforms. But SysGenID as in this patch
> is a completely hardware agnostic concept.

Ok, this is going to play havoc with fuzzers and other "automated
testers", should be fun to watch!  :)

Let's queue this up and see what happens...

thanks,

greg k-h

