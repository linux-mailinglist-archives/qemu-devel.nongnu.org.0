Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8FF438C70
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 00:53:14 +0200 (CEST)
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1memMb-0008AO-Bv
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 18:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <spamcollector@cableone.net>)
 id 1memLi-0007VX-36
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 18:52:18 -0400
Received: from mail2.cableone.syn-alias.com ([69.168.106.66]:59250
 helo=mail.cableone.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <spamcollector@cableone.net>)
 id 1memLf-0004G9-Eb
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 18:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha1; d=cableone.net; s=20180516; c=relaxed/simple; 
 q=dns/txt; i=@cableone.net; t=1635115930;
 h=From:Subject:Date:To:MIME-Version:Content-Type;
 bh=ZTnWofhxJlK1WgJCU+1bLn6eRy8=;
 b=hztQGqkYafLQ62Ll3/lR7k6JTXDcBd1TXNqL7EG4q6TQbE5kj5L26pgNXGGOMHcI
 bzeMtBwQbE8aQj3ifiyuAjuQCnNDgI8ka2t/n+1XUG/1L9dj/uwQ0jOShY8cRjL6
 Fd5mAHbt5MkjhUbbDy+mi24hs5vLjdHkjdRN0kqulRTp0sTFsv0MTi9PcaPSIFsw
 ysxVETejgm+/99iK/ywX8oj3Oo1UkX6jJQ3QVISaT8+44IxJmBBuGHopGSjIQz8h
 Et43icTfqv0yR3gmxjAkCoiRNDMr2KGA1I+RinFDDyZNzwagvtTj6V8oXlznopRL
 WiP8ekHnLdYGszKOs+ptXg==;
X-Authed-Username: c3BhbWNvbGxlY3RvckBjYWJsZW9uZS5uZXQ=
Received: from [10.80.124.25] ([10.80.124.25:53818]
 helo=md04.lapis.bos.sync.lan)
 by mail.cableone.net (envelope-from <spamcollector@cableone.net>)
 (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTP
 id 78/6C-02286-A93E5716; Sun, 24 Oct 2021 18:52:10 -0400
Date: Sun, 24 Oct 2021 18:52:10 -0400 (EDT)
From: spam collector <spamcollector@cableone.net>
To: qemu-devel@nongnu.org
Message-ID: <1778539601.5719140.1635115930316.JavaMail.zimbra@cableone.net>
Subject: UASP and Streams
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [72.24.78.79]
X-Mailer: Zimbra 8.7.6_GA_1776 (ZimbraWebClient - FF92 (Win)/8.7.6_GA_1776)
Thread-Index: Dov+MgfQKdyEp0sWzATAkiRaZYEBwA==
Thread-Topic: UASP and Streams
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefgedgudegucetufdoteggodetrfdotffvucfrrhho
X-Vade-Analysis-2: fhhilhgvmecuufgjpfetvefqtfdpuffrmfdpqfgfvfenuceurghilhhouhhtmecufedtudenucenucfj
X-Vade-Analysis-3: ughrpeffhffvkffugggtgfhiofhtsehtjegttdertdejnecuhfhrohhmpehsphgrmhcutgholhhlvggt
X-Vade-Analysis-4: thhorhcuoehsphgrmhgtohhllhgvtghtohhrsegtrggslhgvohhnvgdrnhgvtheqnecuggftrfgrthht
X-Vade-Analysis-5: vghrnhepleetudffueehgfefteevvdfhgeejteffkeetgedugeduueehueefteeuiefhleejnecuffho
X-Vade-Analysis-6: mhgrihhnpehgihhtlhgrsgdrtghomhenucfkphepuddtrdektddruddvgedrvdehpdejvddrvdegrdej
X-Vade-Analysis-7: kedrjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtrdektddruddv
X-Vade-Analysis-8: gedrvdehpdhhvghlohepmhgutdegrdhlrghpihhsrdgsohhsrdhshihntgdrlhgrnhdpmhgrihhlfhhr
X-Vade-Analysis-9: ohhmpehsphgrmhgtohhllhgvtghtohhrsegtrggslhgvohhnvgdrnhgvthdprhgtphhtthhopehqvghm
X-Vade-Analysis-10: uhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhhohhsthepshhmthhprdhlrghpihhsrdgsohhsrdhs
X-Vade-Analysis-11: hihntgdrlhgrnhdpshhpfhepnhgvuhhtrhgrlhdpughkihhmpedpnhgspghrtghpthhtohepuddptehu
X-Vade-Analysis-12: thhhqdgfshgvrhep
X-Vade-Client: LAPIS
Received-SPF: pass client-ip=69.168.106.66;
 envelope-from=spamcollector@cableone.net; helo=mail.cableone.net
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have a question about the emulation of streams and UASP with the two xhci controller options QEMU supports: qemu-xhci and nec-usb-xhci

It is my understanding that the UASP code checks to see if streams are supported by simply checking if the device is a Super Speed Device?

https://gitlab.com/qemu-project/qemu/-/blob/master/hw/usb/dev-uas.c#L338
  static bool uas_using_streams(UASDevice *uas)
  {
      return uas->dev.speed == USB_SPEED_SUPER;
  }

The "qemu-xhci" xHC option supports streams, however the "nec-usb-xhci" xHC option does not.
xHC:HCCPARAMS1: Bits 15:12 = 7 on the former and 0 on the latter.

Also, the above code assumes the device attached supports streams.

My question is, does QEMU's current implementation of UASP assume that streams are supported by the xHCI xHC?
If so, UASP won't work with the "nec-usb-xhci" xHC option.

Also, if the Guest OS doesn't support streams on a xHC that does--by this OS setting the correct values in the xHCI EndPoint's Context ( MaxPStreams = 0, LSA = 0, HID = 1, etc. )--a correct emulation should still work without streams, correct?

Is the above information a correct assumption on the current UASP emulation, or have I missed something all-together?

Anyway, I thank all of you who have put in so much time and effort into this emulator.  It is much appreciated.
Ben

