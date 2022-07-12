Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5103571BF0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 16:06:36 +0200 (CEST)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBGX5-0002ID-Fy
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 10:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ikskuh@mailbox.org>)
 id 1oBARF-0002hV-B4
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:36:09 -0400
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103]:52206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <ikskuh@mailbox.org>)
 id 1oBAR9-0004dv-D0
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:36:08 -0400
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4LhsxH3j3Pz9sSq;
 Tue, 12 Jul 2022 09:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1657611347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfmPm7KOWpMVKZffDbI4BDXEZvRJXO3OTAioj1gEP+w=;
 b=d2jp8t4Yxws8GpJPh8zQQWrg2XFm077AOy8Rd/IgEnfPSQYUvEp/GcJE48DoNeqvlDmrEt
 L9WieDbqyjOU4/esZk5s8IQ3z/Ql0iXgTzik2TH1R+6OWqBSO8Feru9hQaKoBzh+cppPyS
 ftbO2clSKAaHycnqOvNwFtdsFN601KrdsUDzX6T8xgAVJS/AxPta3vt6gVvMmYzY9PSyr+
 pHHuvB/nYLLomb5AmNM9bBut24s0BcSYZiU9SLmeJumnJ1Q3rOTxTQjhoPlPSbtsLY8bGe
 5H5hb9AgqcCqfrWd7dp8uK+Mn67Tfw5JemJ21iSvBt8LBN1njFmsnBpbHGPXXg==
Message-ID: <3026dec8-3bad-6996-956d-6d8407263be5@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1657611345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfmPm7KOWpMVKZffDbI4BDXEZvRJXO3OTAioj1gEP+w=;
 b=R8O+CUsVPFWf9rILDGCdutzBjyFovuuwAX2PsN+ZcQU+DPly+2lVLMWDXPTyf+f59WiMOa
 T0SqwMa96c4gtP87nWyfQKACi6McDI9OVKKcg3I5sHza6//huFS8gB0douuyY4CCA2itWL
 3XI41r8lu/BRS8WcCna0B3gwZOZNO9JhneX3C+d/+rfrZzdPgj45aZxqfD4WorqwqF7e7J
 L9Ndzs84JS4ohNI4T338W+dLhT8XAeC8CNWfwaRXH6oEj3QpvYiTXY13gIQXBNpYHJ9a7G
 M1Aw+ybH+ibA/emAGumpKrRDYXfQulcCtv7G/eKJ5+X1ZL23LoTadc2bGSgT1w==
Date: Tue, 12 Jul 2022 09:35:44 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] gtk: Add show_tabs=on|off command line option.
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220627164404.12137-1-xq@random-projects.net>
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Hanna Reitz <hreitz@redhat.com>
From: =?UTF-8?Q?Felix_Quei=c3=9fner?= <ikskuh@mailbox.org>
In-Reply-To: <20220627164404.12137-1-xq@random-projects.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: yfb34bwo3ht57f55juq8qku7cjazikfk
X-MBO-RS-ID: 8648726f8553b8a0d2f
X-Rspamd-Queue-Id: 4LhsxH3j3Pz9sSq
Received-SPF: pass client-ip=2001:67c:2050:0:465::103;
 envelope-from=ikskuh@mailbox.org; helo=mout-p-103.mailbox.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Jul 2022 10:01:21 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Heya!

On 27.06.22 18:44, Felix xq Queißner wrote:
> The patch adds "show_tabs" command line option for GTK ui similar to "grab_on_hover". This option allows tabbed view mode to not have to be enabled by hand at each start of the VM.

On 30.06.22 16:09, Hanna Reitz wrote:
 > [snip]

On 30.06.22 16:53, Markus Armbruster wrote:
 > [snip]

On 01.07.22 12:00, Gerd Hoffmann wrote:
 > [snip]

I have addressed the things mentioned:
- limiting line length to 80 in ui.json, qemu-options.hx
- limiting line length in commit to 72
- improved description of the option as Hanna suggested

On 01.07.22 11:14, Zhang, Chen wrote:
 >> Signed-off-by: Felix "xq" Queißner <xq@random-projects.net>
 >
 > Thanks your patch, but please use your real name to sign a patch.

Not sure what to do about this one. Felix Queißer *is* my real name, so 
the only thing i could do is to remove the "xq"?

Should i submit my changes as a response to this or create a new mail 
thread with a new patch?

Regards
- Felix

