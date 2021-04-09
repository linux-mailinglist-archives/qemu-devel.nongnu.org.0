Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33203594D0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 07:41:30 +0200 (CEST)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUjtZ-0001CC-Fg
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 01:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUjsa-0000gS-F7
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 01:40:28 -0400
Received: from 8.mo51.mail-out.ovh.net ([46.105.45.231]:46373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUjsY-0008EK-Dw
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 01:40:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 088DB27EB9D;
 Fri,  9 Apr 2021 07:40:14 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 9 Apr 2021
 07:40:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004739fbf04-3939-4dad-b9c1-fdfa5f6a1911,
 694B77786241735DAA2FE1C32354A61D954E149A) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 9 Apr 2021 07:40:11 +0200
From: Greg Kurz <groug@kaod.org>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [PATCH] checkpatch: Fix use of uninitialized value
Message-ID: <20210409074011.12ea4ed2@bahia.lan>
In-Reply-To: <20210408174913.GA218869@ls>
References: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
 <20210408174913.GA218869@ls>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 28d33729-db44-4276-8ee4-45a4c56d0d1c
X-Ovh-Tracer-Id: 16770560589358930339
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepmhhsthesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=46.105.45.231; envelope-from=groug@kaod.org;
 helo=8.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 10:49:13 -0700
Isaku Yamahata <isaku.yamahata@gmail.com> wrote:

> 
> How about initializing them explicitly as follows?
> ($realfile ne '') prevents the case realfile eq '' && acpi_testexpted eq ''.
> Anyway your patch also should fix it. So
> Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8f7053ec9b..2eb894a628 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1325,8 +1325,8 @@ sub process {
>  	my %suppress_whiletrailers;
>  	my %suppress_export;
>  
> -        my $acpi_testexpected;
> -        my $acpi_nontestexpected;
> +        my $acpi_testexpected = '';
> +        my $acpi_nontestexpected = '';
>  

Hmm... I haven't tried but I believe this will break when these are
passed to checkfilename() :

sub checkfilename {
        my ($name, $acpi_testexpected, $acpi_nontestexpected) = @_;
[...]
        if (defined $$acpi_testexpected and defined $$acpi_nontestexpected) {
                ERROR("Do not add expected files together with tests, " .


>  	# Pre-scan the patch sanitizing the lines.
>  
> 
> On Thu, Apr 08, 2021 at 08:51:19AM +0200,
> Greg Kurz <groug@kaod.org> wrote:
> 
> > checkfilename() doesn't always set $acpi_testexpected. Fix the following
> > warning:
> > 
> > Use of uninitialized value $acpi_testexpected in string eq at
> >  ./scripts/checkpatch.pl line 1529.
> > 
> > Fixes: d2f1af0e4120 ("checkpatch: don't emit warning on newly created acpi data files")
> > Cc: isaku.yamahata@intel.com
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  scripts/checkpatch.pl |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 8f7053ec9b26..3d185cceac94 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -1532,6 +1532,7 @@ sub process {
> >  		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
> >  		      (defined($1) || defined($2)))) &&
> >                        !(($realfile ne '') &&
> > +                        defined($acpi_testexpected) &&
> >                          ($realfile eq $acpi_testexpected))) {
> >  			$reported_maintainer_file = 1;
> >  			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
> > 
> > 
> > 
> 


