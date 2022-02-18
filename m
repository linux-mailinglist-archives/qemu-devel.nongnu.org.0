Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65FA4BC186
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 22:06:33 +0100 (CET)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLASW-0005xk-9C
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 16:06:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nLARD-0005Ec-Al
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 16:05:11 -0500
Received: from relay68.bu.edu ([128.197.228.73]:49816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nLARA-0003KF-03
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 16:05:09 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 21IL3g24031480
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Feb 2022 16:03:50 -0500
Date: Fri, 18 Feb 2022 16:03:42 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Message-ID: <20220218210323.hw2kkid25l7jczjo@mozz.bu.edu>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, bdas@redhat.com,
 kvm <kvm@vger.kernel.org>, Sergio Lopez <slp@redhat.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, John Snow <jsnow@redhat.com>,
 Alex Agache <aagch@amazon.com>, qemu-devel <qemu-devel@nongnu.org>, "Florescu,
 Andreea" <fandree@amazon.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 darren.kenny@oracle.com, hreitz@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 220128 1547, Stefan Hajnoczi wrote:
> Dear QEMU, KVM, and rust-vmm communities,
> QEMU will apply for Google Summer of Code 2022
> (https://summerofcode.withgoogle.com/) and has been accepted into
> Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> submit internship project ideas for QEMU, KVM, and rust-vmm!
> 
> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> be a mentor. It's a great way to give back and you get to work with
> people who are just starting out in open source.
> 
> Please reply to this email by February 21st with your project ideas.
> 
> Good project ideas are suitable for remote work by a competent
> programmer who is not yet familiar with the codebase. In
> addition, they are:
> - Well-defined - the scope is clear
> - Self-contained - there are few dependencies
> - Uncontroversial - they are acceptable to the community
> - Incremental - they produce deliverables along the way
> 
> Feel free to post ideas even if you are unable to mentor the project.
> It doesn't hurt to share the idea!

Here are two fuzzing-related ideas:

Summary: Implement rapid guest-initiated snapshot/restore functionality (for
Fuzzing).

Description:
Many recent fuzzing projects rely on snapshot/restore functionality
[1,2,3,4,5]. For example tests/fuzzers that target large targets, such as OS
kernels and browsers benefit from full-VM snapshots, where solutions such as
manual state-cleanup and fork-servers are insufficient. 
Many of the existing solutions are based on QEMU, however there is currently no
upstream-solution. Furthermore, hypervisors, such as Xen have already
incorporated support for snapshot-fuzzing.
In this project, you will implement a virtual-device for snapshot fuzzing,
following a spec agreed-upon by the community.  The device will implement
standard fuzzing APIs that allow fuzzing using engines, such as libFuzzer and
AFL++. The simple APIs exposed by the device will allow fuzzer developers to
build custom harnesses in the VM to request snapshots, memory/device/register
restores, request new inputs, and report coverage.

[1] https://arxiv.org/pdf/2111.03013.pdf
[2] https://blog.mozilla.org/attack-and-defense/2021/01/27/effectively-fuzzing-the-ipc-layer-in-firefox/
[3] https://www.usenix.org/system/files/sec20-song.pdf
[4] https://github.com/intel/kernel-fuzzer-for-xen-project
[5] https://github.com/quarkslab/rewind

Skill level: Intermediate with interest and experience in fuzzing.
Language/Skills: C
Topic/Skill Areas: Fuzzing, OS/Systems/Drivers

Summary: Implement a coverage-guided fuzzer for QEMU images

Description:
QEMU has a qcow2 fuzzer (see tests/image-fuzzer). However, this fuzzer is not
coverage-guided, and is limited to qcow2 images. Furthermore, it does not run
on OSS-Fuzz. In some contexts, qemu-img is expected to handle untrusted disk
images. As such, it is important to effectively fuzz this code.
Your task will be to create a coverage-guided fuzzer for image formats
supported by QEMU. Beyond basic image-parsing code, the fuzzer should be able
to find bugs in image-conversion code.  Combined with a corpus of QEMU images,
the fuzzer harness will need less information about image layout.

Skill level: Intermediate
Language/Skills: C
Topic/Skill Areas: Fuzzing, libFuzzer/AFL

Thanks
-Alex

