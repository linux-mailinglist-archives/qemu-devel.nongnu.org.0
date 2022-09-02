Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C65AAABF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:58:13 +0200 (CEST)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2V9-0004X6-Nu
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oU2PY-0007zH-AK
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:52:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oU2PR-0006IJ-KD
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662108735;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bup53ErdscYAPsr6yTgzdL9aoYCEtznpLkPSlEqj9zQ=;
 b=BieIAzVefbKNemm7D9V27ytGSwwJF3RWggLucCk7el8bK2KzRIk7cCdTSNCbq25T1PyAK3
 iGcVwDcxQFxqR4OD/G/qcFhMju+Lxe9AkY+XNNC8cNVUW/ib2qZXe+ylbj3Spjp7hyaTZ6
 vgAOsm2+DyYAcsppkgFHtg6Z/xFhaqU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-vedHmw0_Pom6OB4meq2gJg-1; Fri, 02 Sep 2022 04:52:12 -0400
X-MC-Unique: vedHmw0_Pom6OB4meq2gJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E69158039C5;
 Fri,  2 Sep 2022 08:52:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F6EAC15BC3;
 Fri,  2 Sep 2022 08:52:10 +0000 (UTC)
Date: Fri, 2 Sep 2022 09:52:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: "Wang, Lei" <lei4.wang@intel.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [RFC PATCH] Add qemu .clang-format
Message-ID: <YxHEOEpjABDZu18j@redhat.com>
References: <1443720628-16512-1-git-send-email-marcandre.lureau@redhat.com>
 <9cb1a173-c703-1787-90e1-4668710b323b@intel.com>
 <Yw8gpOzspxrcE8rE@redhat.com>
 <6f4292c6-5f85-f3c7-7b65-e5a59dd71dbc@intel.com>
 <Yw86WjTzwNcALfVJ@redhat.com>
 <d865b7f4-b3bc-9f24-a697-6ff830637133@intel.com>
 <YxBpgeL7yJIkXV/f@redhat.com>
 <2304fd90-b77a-f0ba-8979-61ac37b389b2@intel.com>
 <87bkrznw1w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkrznw1w.fsf@linaro.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 01, 2022 at 12:55:36PM +0100, Alex Bennée wrote:
> 
> "Wang, Lei" <lei4.wang@intel.com> writes:
> 
> > On 9/1/2022 4:12 PM, Daniel P. Berrangé wrote:
> >> On Thu, Sep 01, 2022 at 09:08:33AM +0800, Wang, Lei wrote:
> >>> On 8/31/2022 6:39 PM, Daniel P. Berrangé wrote:
> >>>> On Wed, Aug 31, 2022 at 05:18:34PM +0800, Wang, Lei wrote:
> >>>>>
> >>>>>
> >>>>> On 8/31/2022 4:49 PM, Daniel P. Berrangé wrote:
> >>>>>> On Wed, Aug 31, 2022 at 02:23:51PM +0800, Wang, Lei wrote:
> >>>>>>>
> >>>>>>> On 10/2/2015 1:30 AM, marcandre.lureau@redhat.com wrote:
> >>>>>>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >>>>>>>>
> >>>>>>>> clang-format is awesome to reflow your code according to qemu coding
> >>>>>>>> style in an editor (in the region you modify).
> >>>>>>>>
> >>>>>>>> (note: clang-tidy should be able to add missing braces around
> >>>>>>>> statements, but I haven't tried it, it's quite recent)
> >>>>>>>>
> >>>>>>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> >>>>>>>> ---
> >>>>>>>>     .clang-format | 6 ++++++
> >>>>>>>>     1 file changed, 6 insertions(+)
> >>>>>>>>     create mode 100644 .clang-format
> >>>>>>>>
> >>>>>>>> diff --git a/.clang-format b/.clang-format
> >>>>>>>> new file mode 100644
> >>>>>>>> index 0000000..6422547
> >>>>>>>> --- /dev/null
> >>>>>>>> +++ b/.clang-format
> >>>>>>>> @@ -0,0 +1,6 @@
> >>>>>>>> +BasedOnStyle: LLVM
> >>>>>>>> +IndentWidth: 4
> >>>>>>>> +UseTab: Never
> >>>>>>>> +BreakBeforeBraces: Linux
> >>>>>>>> +AllowShortIfStatementsOnASingleLine: false
> >>>>>>>> +IndentCaseLabels: false
> >>>>>>>
> >>>>>>> Hi, any progress on this? I also found a gist on GitHub which can be a
> >>>>>>> reference: https://gist.github.com/elmarco/aa5e0b23567f46fb7f0e73cde586a0c1
> >>>>>>
> >>>>>> clang-format is a great tool and I'd highly recommend its use on
> >>>>>> any newly started projects, and even retrospectively on existing
> >>>>>> projects which are small scale. Adding it to large existing projects
> >>>>>> is problematic though.
> >>>>>>
> >>>>>> None of the QEMU code complies with it today and indeed there is
> >>>>>> quite a bit of style variance across different parts of QEMU. If
> >>>>>> we add this config file, and someone makes a 1 line change in a
> >>>>>> file, clang-format will reformat the entire file contents.
> >>>>>>
> >>>>>> The only practical way to introduce use of clang-format would be
> >>>>>> to do a bulk reformat of the entire codebase. That is something
> >>>>>> that is quite disruptive to both people with patches they're
> >>>>>> working on but not submitted yet, as well as people wanting to
> >>>>>> cherry-pick new commits back to old code branches.
> >>>>>>
> >>>>>> With regards,
> >>>>>> Daniel
> >>>>>
> >>>>> I think the benefits of introducing clang-format mainly for its ability to
> >>>>> format a code range, which means for any future contributions, we could
> >>>>> encourage a range format before the patch is generated. This can extensively
> >>>>> simplify my workflow, especially because I use the Neovim + LSP combination,
> >>>>> which supports a built-in function "lua vim.lsp.buf.range_formatting()".
> >>>>
> >>>> IMHO partial format conversions are even worse than full conversions,
> >>>> because they would make code inconsistent within the scope of a file.
> >>>
> >>> So you mean when we're adding new code in an old file, the coding style
> >>> should also be the old one? That sounds a bit unreasonable. I thought we are
> >>> shifting the coding style in an on-demand way, so we can finally achieve to
> >>> the new style mildly, if each time we're using the old coding style, that
> >>> could be impossible.
> >> 
> >> From my POV as a maintainer, the best situation would be consistency across
> >> the entire codebase. Since we likely won't get that though, then next best
> >> is consistency across the subsystem directory, and next best is consistency
> >> across the whole file.  Mixing code styles within a file is the worst IMHO.
> >> 
> >>>
> >>>>> I have no interest in reformatting the existing code and also think using it
> >>>>> to reformat an entire file shouldn't be encouraged, but, we can leverage
> >>>>> this tool to give future contributions a better experience. It's also
> >>>>> important to note that the kernel already has a ".clang-format" file, so I
> >>>>> think we can give it a try:)
> >>>>
> >>>> The mere action of introducing a .clang-format file in the root of the
> >>>> repository will cause some contributors' editors to automatically
> >>>> reformat files every time they are saved. IOW even if you don't want
> >>>> intend to do reformatting, that will be a net result.
> >>>
> >>> I think that depends on developer's configuration, as far as I know, format
> >>> on save is a feature which can be easily disabled on most of the IDE's, such
> >>> as VSCode.
> >> 
> >> You could disable it, but it requires each developer to know that we're
> >> shipping a clang-format that should not in fact be used to reformat
> >> code, which is rather counterintuitive. 
> >> 
> >> With regards,
> >> Daniel
> >
> > OK, your POV makes sense too. I think we can do a tradeoff, for an example, we
> > can add an officially suggested ".clang-format" file in the documentation, so it
> > won't confuse the developers who have no interest in the clang stuffs, and it
> > will also be more convenient for the developers who don't want to check the
> > coding style manually each time before they're submitting a patch.
> 
> For most editors we already have a .editorconfig but it looks like there
> is no integration for clang-format there. We could put a file in
> contrib/style/ for an explicit call:
> 
>   clang-format -style=contrib/style/clang.format
> 
> I suspect we should move the .dir-locals there to given Emacs users
> should be able to use the .editorconfig and it reduces duplication.

I'd be against that on the basis that EditorConfig support is an
add-on for emacs which we can't be sure our contributors will have
installed. The .dir-locals ensures we get sensible behaviour from
all emacs users by default.

> And of course mention the location of these style linters in
> docs/devel/style.rst

Note clang-format is not a style linter - it is a bulk code
reformatter that does waaaaaaay more than the .editorconfig
or .dir-locals does - our code is largely compliant with
the .editorconfig/.dir-locals rules, so it is good that we
ensure continued compliance by default.  clang-format is a
completely different situation as essentially none of our
code will be compliant today.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


