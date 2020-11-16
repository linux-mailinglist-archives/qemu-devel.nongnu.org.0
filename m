Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38F2B5155
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:40:02 +0100 (CET)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekM4-0005sd-Vz
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kejfr-0006YY-PB
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:56:23 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:55576 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kejfn-0006Bl-Rw
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:56:23 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EB06941393;
 Mon, 16 Nov 2020 18:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1605552975;
 x=1607367376; bh=ROP9vd7BeyPCLABAx01ffzbN9iQrJDypJhPf+Dq5VNg=; b=
 d3KR2oxC/abgauUub9qi683o7XSTd5nye7Gl8V24Oj5/LG2e58/W8xbg4XmNS9UG
 unzuBoIwAzHWTJslbB3mO+B/zTJkvxki9fEEj/NvcFFBQCWFNp3gaGSqG5ycwkKT
 Qz9FBb3qhpGwoes+7w9nnDWjl4XMB32oLTR7FZ4z8pE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wces7dAJv_B2; Mon, 16 Nov 2020 21:56:15 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B934241378;
 Mon, 16 Nov 2020 21:56:15 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 16
 Nov 2020 21:56:15 +0300
Date: Mon, 16 Nov 2020 21:56:14 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
Message-ID: <20201116185614.GA38857@SPB-NB-133.local>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:56:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 10:20:04AM -0600, Eric Blake wrote:
> On 11/16/20 7:10 AM, Roman Bolshakov wrote:
> > There's a problem for management applications to determine if certain
> > accelerators available. Generic QMP command should help with that.
> > 
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
> >  monitor/qmp-cmds.c | 15 +++++++++++++++
> >  qapi/machine.json  | 19 +++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> > 
> 
> > +++ b/qapi/machine.json
> > @@ -591,6 +591,25 @@
> >  ##
> >  { 'command': 'query-kvm', 'returns': 'KvmInfo' }
> >  
> > +##
> > +# @query-accel:
> > +#
> > +# Returns information about an accelerator
> > +#
> > +# Returns: @KvmInfo
> > +#
> > +# Since: 6.0.0
> 
> We're inconsistent on whether we have 'Since: x.y' or 'Since: x.y.z',
> although I prefer the shorter form.  Maybe Markus has an opnion on that.
> 

Sure, please let me know which one is better.

> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-accel", "arguments": { "name": "kvm" } }
> > +# <- { "return": { "enabled": true, "present": true } }
> > +#
> > +##
> > +{ 'command': 'query-accel',
> > +  'data': { 'name': 'str' },
> > +  'returns': 'KvmInfo' }
> 
> '@name' is undocumented and an open-coded string.
>

Thanks for catching that! I'll add documentation for the field.

> Better would be requiring 'name' to be one of an enum type.

I haven't found any enums available, that's why I used accel_find that
looks up accel from string in QOM.

> Even better would be returning an array of KvmInfo with information on
> all supported accelerators at once, rather than making the user call
> this command once per name.
> 

I considered that, but wasn't sure if it's right or wrong. I'd prefer it
over the first option with enums. Likely, we can do that by iterating
all concerete accelerators:

  object_class_get_list(TYPE_ACCEL, false);

name parameter can be then dropped and query-accel would be renamed to
query-accels.

The approach has a drawback - there's no way to return accelerators that
aren't compiled, i.e. kvm on macOS or hvf on Linux. I don't know if it's
an issue or not.

query-accels would only return all available accelerators registered via
QOM and one of them would be enabled.

I think I'd try to use query-accel in libvirt before proceeding with
query-accels. If it'll be apparent that query-accels is superior, then'd
go with it.

Thanks,
Roman

