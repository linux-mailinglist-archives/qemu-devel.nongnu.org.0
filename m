Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73496A6A30
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:55:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJB5-0001s1-Hv; Wed, 01 Mar 2023 04:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pXJB3-0001rq-IF
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pXJB1-0003RX-PO
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677664510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2bJHEiOzImdh+CVnRAPSAR/szb1ffWP12CAO2YT0k2I=;
 b=abWWNylETYynHanuxlPLfNJyxXiqM61eM68MNY79jtjgk80D9N6sxSlqjsiAThnNwB+yb1
 1fO/gKzPS+ok10at6+xLsWcE3fcP9u6pr8QmmjVU0SA9w/FTO2B3yJVjnUBOb3FsW3CfRe
 rRFDbhJol1YTe067zUFgV/8eQNIxnjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-2ZL0q3sXMWOI7USuZ1vhFg-1; Wed, 01 Mar 2023 04:55:07 -0500
X-MC-Unique: 2ZL0q3sXMWOI7USuZ1vhFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B55A219705A8;
 Wed,  1 Mar 2023 09:55:06 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.45.242.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 055AC40C6EC4;
 Wed,  1 Mar 2023 09:55:04 +0000 (UTC)
Date: Wed, 1 Mar 2023 10:55:02 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] qapi: Add 'acpi' field to 'query-machines' output
Message-ID: <Y/8g9tar75vaso4J@angien.pipo.sk>
References: <537625d3e25d345052322c42ca19812b98b4f49a.1677571792.git.pkrempa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537625d3e25d345052322c42ca19812b98b4f49a.1677571792.git.pkrempa@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 28, 2023 at 09:12:34 +0100, Peter Krempa wrote:
> Report which machine types support ACPI so that management applications
> can properly use the 'acpi' property even on platforms such as ARM where
> support for ACPI depends on the machine type and thus checking presence
> of '-machine acpi=' in 'query-command-line-options' is insufficient.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> ---
> 
> Diff to v1:
>  - Fix spelling of 'ACPI' in 'machine.json'
>  - Removed addition of a field to 'struct MachineClass' which was not
>     used in the final version

It would be great to get this patch into the release as will allow
libvirt to properly handle setting of ACPI now that '-no-acpi' flag was
recently deprecated:

https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg07926.html

The libvirt patches which make use of this feature were posted at:

https://listman.redhat.com/archives/libvir-list/2023-March/238217.html


