Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5AA283AA4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 17:36:12 +0200 (CEST)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPSX5-0007mf-18
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 11:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPSVE-0006hw-Q9
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPSVB-0006HB-Ac
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601912051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHeJaB6QRqc1yecKc5f45y2ODhEYjb9V9KmFqXOeV28=;
 b=McTpYj2Z2c1kzfcHK3jU/sN40dkDceMwC0uORqxF/0aWYtsZaj7d22gZpML5UIIyj0M35H
 31GT6idg7zSxuVX6BAsQSDbLi2SIopVF20/tUvcvF9FCvJT0mRJkYwrTijLK6hMrAvncNM
 94CKNvmzHxs2ex4pfwOxJHRRWC2Ly7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-E6jTIEIlPWqR_tNRRLpQ-g-1; Mon, 05 Oct 2020 11:34:05 -0400
X-MC-Unique: E6jTIEIlPWqR_tNRRLpQ-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69C268B4C73;
 Mon,  5 Oct 2020 15:33:54 +0000 (UTC)
Received: from [10.10.120.38] (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93C3460C11;
 Mon,  5 Oct 2020 15:33:52 +0000 (UTC)
Subject: Re: QEMU API cleanup initiative - Let's chat during the KVM call
From: John Snow <jsnow@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
References: <1f0b0576-eb07-bf5a-a4d8-c6a2d18d1a94@redhat.com>
Message-ID: <62147dfc-ef6a-238c-d26c-0907fcb7d6ba@redhat.com>
Date: Mon, 5 Oct 2020 11:33:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1f0b0576-eb07-bf5a-a4d8-c6a2d18d1a94@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/20 8:14 PM, John Snow wrote:
> Hi, everyone! I'd like to discuss some of this in the upstream KVM call.
> 
> TLDR: I would like to begin an organized effort to consolidate our CLI 
> parsing, moving it onto QAPI. I'd like to talk about how we should 
> proceed on the KVM call, prior to KVM Forum, where we should continue 
> these discussions.
> 

Call details:

( https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg00997.html )

 > You can join the call from your web browser here:
 > https://bluejeans.com/497377100
 >
 > Meeting ID: 497377100
 > Phone numbers: https://www.redhat.com/en/conference-numbers

The call is at 13:00 UTC:

- 09:00 EDT
- 15:00 CEST


Intended area of focus:

- What work needs to be done to move the CLI onto QAPI
- How do we measure/document this conversion progress?
- What are the criteria for a complete conversion?
- How do we distribute this work?


(See quoted below for context/detail)


> 
> Background
> ----------
> 
> You may recall late last December that Stefan started a big discussion 
> thread about Modernizing the QEMU API:
> "Making QEMU easier for management tools and applications" [1]
> 
> There were lots of opinions and directions proposed for this, with many 
> competing visions for where QEMU should go, or what it ought endeavor to 
> be.
> 
> Though many of these visions conflict in terms of the implementations 
> for their end goal, many shared a similar logical end-goal and shared 
> some concrete intermediate steps. One of those concrete intermediate 
> steps is the consolidation of our configuration and startup mechanisms 
> into a unified API.
> 
> 
> The QEMU API, Today
> ------------------
> 
> At the moment, QAPI is our most formal system for declaring types, 
> structures and interfaces. I believe QAPI is not going anywhere, and so 
> I am doubling down and committing to improving and expanding the QAPI 
> subsystem.
> 
> I wanted to understand what QEMU's existing interface even *was*. We can 
> understand QEMU's interface to be four components presently:
> 
> 1. The QEMU Monitor Protocol (QMP)
> 
> QMP is based explicitly on top of QAPI, which we do indeed have formal 
> specifications for in ./qapi. They are not standards-compliant, but they 
> are at least unified.
> 
> 2. The GTK UI
> 
> The GTK UI offers very minimal interface, and does not offer any feature 
> that is not available through one of the other interfaces or standard 
> operating system UI. Good!
> 
> 3. The Human Monitor Protocol (HMP)
> 
> HMP is increasingly based on QMP, though the conversion is not complete 
> and it is not clear if it will be "complete". This was a major sub-topic 
> of the thread last December with no clear consensus. Some work continues 
> to bring major HMP features over to QMP; notably Daniel Berrange has 
> been trying to port savevm/loadvm over to QMP [2]. For now, it seems 
> like HMP will be with us at least as a debugging and development 
> interface. There is work to be done to audit and inventory any remaining 
> features that must be ported to QMP, which are reundant with QMP, and 
> which are uniquely useful as debugging interfaces.
> 
> 4. The QEMU command-line
> 
> Last, we have the QEMU CLI. This interface was grown organically over 
> time and features many different parser subsystems and loosely federated 
> components with no unified specification document that explains the 
> entire shape of the CLI.
> 
> 
> Auditing the CLI interface
> --------------------------
> 
> I wanted to know what our CLI really looked like. Not trusting any of 
> our existing documentation to be complete/authoritative, I used the QEMU 
> 5.1 release as a basis and audited the entirety of that interface. [3]
> 
> Here's what I found:
> 
> - QEMU 5.1 has 131 command line flags
>    - 93 of these take an argument
>    - 38 of them do not.
> 
> If we want to unify the parsing into a single formal declaration, it 
> would be helpful to know what we're dealing with. Of those flags that 
> take arguments:
> 
> - 3 use QAPI to parse their argument directly
> - 51 use QemuOpts in some way:
>    - 36 use qemu_opts_parse[_noisily] directly
>    - 10 desugar to `qemu_opts_parse_noisily` (-fdc, -hda, et al)
>    - 5 add a single option using `qemu_opt_set`.
> - 1 is parsed rather directly by QOM (-tb-size)
> - 14 are stored directly as (const char *)
> - 3 are parsed into numerical types with atoi/strtol/etc.
> - 21 are parsed by custom parsing mechanisms.
> 
> For full, gory details, please see the document referenced at [3]. It's 
> about 4000 lines of markdown detailing the QAPI/C structures that define 
> each command line argument, as well as some fairly detailed analyses of 
> the custom parsers and exactly which values they accept.
> 
> 
> I'm not reading a 4,000+ line markdown document
> -----------------------------------------------
> 
> Good news! I made a summary spreadsheet to summarize what I found. [4]
> 
> This spreadsheet summarizes the types of arguments we have and what 
> parsers they utilize and their support status. The spreadsheet follows 
> the order of flags as defined in qemu-options.hx, category-by-category.
> 
> I also tried to broadly assign "topics" to each flag for the purposes of 
> laying out a better manual in the future, but I wasn't fully confident 
> in many flags that affect things like boot, firmware, chipset, etc, so 
> this is a work in progress.
> 
> https://docs.google.com/spreadsheets/d/1OJvzDwLpo2XsGytNp9Pr-vYIrb0pWrFKBNPtOyH80ew/edit?usp=sharing 
> 
> 
> If you don't have google, I have an ODS exported version of this 
> spreadsheet too -- feel free to relay your feedback back to me here. [5]
> 
> Paolo Bonzini helped re-organize my initial draft and used it to 
> identify flags perhaps most in need of attention to bring onto a new 
> standard, annotated in yellow.
> 
> (Those items are: -k, -uuid, -no-hpet, -no-reboot, -no-shutdown, 
> -incoming-, and -enable-fips.)
> 
> Of the remainder, quite a few are either already deprecated, are 
> aliases, or are simple sugar for another command that could be expressed 
> more compactly. Quite a few are already using *at least* QemuOpts such 
> that porting them to QAPI should not be extremely mechanically difficult.
> 
> I would like to use the KVM call to discuss a roadmap for converting the 
> remaining options to QAPI, what that would take, and who will take 
> ownership for which subsystems/flags. I would like to bring these 
> discussions to KVM Forum and lend serious, dedicated effort to finishing 
> this task.
> 
> 
> Related work and ongoing efforts
> --------------------------------
> 
> Mentioned above, Daniel Berrange is porting HMP features to QMP [2].
> 
> I am adding python static typing to our QAPI generator in the belief 
> that QAPI will continue to grow in importance for us, and inviting more 
> developers to participate in writing QAPI generator backends by 
> formalizing that interface. [6].
> 
> I am prototyping a new QAPI generator backend that produces Json-Schema, 
> attempting to target various SDK generators that are compatible with 
> e.g. OpenAPI (which uses a modified version Json-Schema as a 
> sub-specification.)
> 
> Eduardo Habkost is working on making all QOM type definitions fully data 
> driven, in the hopes that we might eventually be able to integrate these 
> types with QAPI to eliminate stub types from the API. [7]
> 
> Marc-André is adding a Rust backend to the QAPI generator, along with a 
> new API frontend that can communicate with dbus. [8]
> 
> 
> -- 
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg04840.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg00587.html
> [3] https://gitlab.com/jsnow/qemu/-/blob/cli_audit/docs/cli_audit.md
> [4] 
> https://docs.google.com/spreadsheets/d/1OJvzDwLpo2XsGytNp9Pr-vYIrb0pWrFKBNPtOyH80ew/edit?usp=sharing 
> 
> [5] http://people.redhat.com/~jsnow/qemu-5_1-audit.ods
> [6] https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg10723.html
> [7] https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg08304.html 
> (And more to come)
> [8] https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg03971.html


