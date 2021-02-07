Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72666312094
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 01:22:44 +0100 (CET)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8Xqd-0000m7-2V
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 19:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l8Xou-0000FF-1R
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 19:20:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:49318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l8Xoe-0004GC-GW
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 19:20:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l8Xob-0004pA-EX
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 00:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6C7922E8086
 for <qemu-devel@nongnu.org>; Sun,  7 Feb 2021 00:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Feb 2021 00:15:07 -0000
From: Pedro Pablo Lopez Rodriguez <1861946@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: plopezr
X-Launchpad-Bug-Reporter: Pedro Pablo Lopez Rodriguez (plopezr)
X-Launchpad-Bug-Modifier: Pedro Pablo Lopez Rodriguez (plopezr)
References: <158086314699.19555.9540843580021637812.malonedeb@gac.canonical.com>
Message-Id: <161265690764.4200.13128558605338417264.malone@chaenomeles.canonical.com>
Subject: [Bug 1861946] Re: qemu-4.2.0 qemu-system-i386 not receive scancode 86
 of spanish keyboard (ascii chars '<' & '>')
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 27a7ab6a93394d573e6aa6bba9e915fc172b1b46
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1861946 <1861946@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu 5.1.0 version solved this problem.

Bug solved.

Many Thanks to qemu group and Stefan Weil.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861946

Title:
  qemu-4.2.0 qemu-system-i386 not receive scancode 86 of spanish
  keyboard  (ascii chars '<' & '>')

Status in QEMU:
  New

Bug description:
  Hello.

  I am using qemu-4.2.0 for Windows 64 downloaded from https://qemu.weilnet=
z.de/w64/,
  and I use qemu-system-i386.exe for run Minix 3.1.2a:

    C:\Program Files\qemu> qemu-system-i386 minix3hd.qcow

  All is Ok except the keyboard (spanish).

  Actually the Spanish keyboard has always worked well until the version
  qemu-2.11.0 included. But after that version and until the current
  version the Spanish keyboard has worked with some very annoying bugs.

  The bugs that I encountered in the current version 4.2.0 on Windows
  are:

  1) Scancode 86 (ascii '<') is not received from the Spanish keyboard.

  2) Scancode 41 should be interpreted as 39 (41 -> 39).

  3) in the same way:
  12 -> 53
  13 -> 27
  26 -> 12
  27 -> 13
  43 -> 41
  53 -> 43

  4) Finally and very important in Spain is that scancode 39 should
  produce the national characters '=C3=B1' and '=C3=91'

  I have checked the scancodes sent by running a floppy disk image with
  a boot sector that echoed the scancodes sent by pressing the different
  keys, so the errors are not due in any case to the operating system,
  but to the virtual machine or at most to the BIOS.

  In Minix 3.1.2a I tried to alleviate the errors by modifying the
  keymap: /usr/lib/keymaps/spanish.map. I have managed to solve all the
  errors except the one corresponding to scancode 86 (ascii '<') since
  when the key is pressed on the Spanish keyboard the scancode 86 is not
  sent.

  I accompany the modified keymap: https://github.com/Stichting-MINIX-
  Research-Foundation/minix/blob/R3.1.2/drivers/tty/keymaps/spanish.src
  for it could be clarifying in any way.

  Thank you very much for qemu and the new version 4.2.0. Apart from
  these small details, all the improvements that have been included are
  greatly appreciated.

  Greetings. Pedro Pablo.

  ------------------------- spanish.src (modified #if 0 #else #endif)
  -------------------------

  /* Keymap for Spanish MF-2 keyboard. */
  /* Modified by Javier Garcia Martin jawa@inf.deusto.es */

  u16_t keymap[NR_SCAN_CODES * MAP_COLS] =3D {

  /* scan-code		!Shift	Shift	Alt	AltGr	Alt+Sh	Ctrl	*/
  /* =

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =

  */
  /* 00 - none	*/	0,	0,	0,	0,	0,	0,	=

  /* 01 - ESC	*/	C('['),	C('['),	CA('['),C('['),	C('['),	C('['),
  /* 02 - '1'	*/	'1',	'!',	A('1'),	'|',	'!',	C('A'),
  /* 03 - '2'	*/	'2',	'"',	A('2'),	'@',	'"',	C('@'),
  /* 04 - '3'	*/	'3',	0372,	A('3'),	'#',	0372,	C('C'),
  /* 05 - '4'	*/	'4',	'$',	A('4'),	'4',	'$',	C('D'),
  /* 06 - '5'	*/	'5',	'%',	A('5'),	'5',	'%',	C('E'),
  /* 07 - '6'	*/	'6',	'&',	A('6'),	0252,	'&',	C('F'),
  /* 08 - '7'	*/	'7',	'/',	A('7'),	'{',	'/',	C('G'),
  /* 09 - '8'	*/	'8',	'(',	A('8'),	'(',	'(',	C('H'),
  /* 10 - '9'	*/	'9',	')',	A('9'),	')',	')',	C('I'),
  /* 11 - '0'	*/	'0',	'=3D',	A('0'),	'=3D',	'=3D',	C('@'),
  #if 0
  /* 12 - '-'	*/	'\'',	'?',	A('\''),'?',	'?',	C('_'),     /* deber=C3=ADa s=
er como la (53) */
  #else =

  /* 53 - '/'	*/	'-',	'_',	A('-'), '-',	'_',	C('@'),  =

  #endif
  #if 0
  /* 13 - '=3D'	*/	0255,	0250,	A(0255),0250,	0250,	C('@'),     /* deberia s=
er como la (27) */
  #else
  /* 27 - ']'	*/	'+',	'*',	A('+'),	']',	'*',	C(']'),     =

  #endif
  /* 14 - BS	*/	C('H'),	C('H'),	CA('H'),C('H'),	C('H'),	0177,	=

  /* 15 - TAB	*/	C('I'),	C('I'),	CA('I'),C('I'),	C('I'),	C('I'),
  /* 16 - 'q'	*/	L('q'),	'Q',	A('q'),	'q',	'Q',	C('Q'),
  /* 17 - 'w'	*/	L('w'),	'W',	A('w'),	'w',	'W',	C('W'),
  /* 18 - 'e'	*/	L('e'),	'E',	A('e'),	'e',	'E',	C('E'),
  /* 19 - 'r'	*/	L('r'),	'R',	A('r'),	'r',	'R',	C('R'),
  /* 20 - 't'	*/	L('t'),	'T',	A('t'),	't',	'T',	C('T'),
  /* 21 - 'y'	*/	L('y'),	'Y',	A('y'),	'y',	'Y',	C('Y'),
  /* 22 - 'u'	*/	L('u'),	'U',	A('u'),	'u',	'U',	C('U'),
  /* 23 - 'i'	*/	L('i'),	'I',	A('i'),	'i',	'I',	C('I'),
  /* 24 - 'o'	*/	L('o'),	'O',	A('o'),	'o',	'O',	C('O'),
  /* 25 - 'p'	*/	L('p'),	'P',	A('p'),	'p',	'P',	C('P'),
  #if 0
  /* 26 - '['	*/	'`',	'^',	A('`'),'[',	'^',	C('['),         /* deber=C3=ADa=
 ser como la (12) */
  #else =

  /* 12 - '-'	*/	'\'',	'?',	A('\''),'?',	'?',	C('_'),     =

  #endif
  #if 0
  /* 27 - ']'	*/	'+',	'*',	A('+'),	']',	'*',	C(']'),     /* deberia ser com=
o la (13) */
  #else
  /* 13 - '=3D'	*/	0255,	0250,	A(0255),0250,	0250,	C('@'),
  #endif
  /* 28 - CR/LF	*/	C('M'),	C('M'),	CA('M'),C('M'),	C('M'),	C('J'),
  /* 29 - Ctrl	*/	CTRL,	CTRL,	CTRL,	CTRL,	CTRL,	CTRL,
  /* 30 - 'a'	*/	L('a'),	'A',	A('a'),	'a',	'A',	C('A'),
  /* 31 - 's'	*/	L('s'),	'S',	A('s'),	's',	'S',	C('S'),
  /* 32 - 'd'	*/	L('d'),	'D',	A('d'),	'd',	'D',	C('D'),
  /* 33 - 'f'	*/	L('f'),	'F',	A('f'),	'f',	'F',	C('F'),
  /* 34 - 'g'	*/	L('g'),	'G',	A('g'),	'g',	'G',	C('G'),
  /* 35 - 'h'	*/	L('h'),	'H',	A('h'),	'h',	'H',	C('H'),
  /* 36 - 'j'	*/	L('j'),	'J',	A('j'),	'j',	'J',	C('J'),
  /* 37 - 'k'	*/	L('k'),	'K',	A('k'),	'k',	'K',	C('K'),
  /* 38 - 'l'	*/	L('l'),	'L',	A('l'),	'l',	'L',	C('L'),
  #if 0
  /* 39 - ';'	*/	L(0244),0245,	A(0244),0244,	0245,	C('@'),     /* deberia s=
er como la (26) */
  #else =

  /* 26 - '['	*/	'`',	'^',	A('`'),'[',	'^',	C('['),         =

  #endif
  /* 40 - '\''	*/	'\'',	'"',	A('\''),'{',	'"',	C('@'), =

  #if 0
  /* 41 - '`'	*/	0247,	0246,	A(0247),'\\',	0246,	C('@'),     /* deberia ser=
 como la (=C3=B1=C3=91) */
  #else
  /* 39 - ';'	*/	L(0244),0245,	A(0244),0244,	0245,	C('@'),  =

  #endif
  /* 42 - l. SHIFT*/	SHIFT,	SHIFT,	SHIFT,	SHIFT,	SHIFT,	SHIFT,
  #if 0
  /* 43 - '\\'	*/	L(0207),0200,	A(0207),'}',	0200,	C('@'),     /* deberia s=
er como la (41) */
  #elif 0
  /* 41 - '`'	*/	0247,	0246,	A(0247),'\\',	0246,	C('@'), =

  #else
  /* 41 - '`'	*/	'<',	'>',	A('<'),  '\\',	0246,	C('@'),     /* a=C3=B1adimo=
s < y > */
  #endif
  /* 44 - 'z'	*/	L('z'),	'Z',	A('z'),	'z',	'Z',	C('Z'),
  /* 45 - 'x'	*/	L('x'),	'X',	A('x'),	'x',	'X',	C('X'),
  /* 46 - 'c'	*/	L('c'),	'C',	A('c'),	'c',	'C',	C('C'),
  /* 47 - 'v'	*/	L('v'),	'V',	A('v'),	'v',	'V',	C('V'),
  /* 48 - 'b'	*/	L('b'),	'B',	A('b'),	'b',	'B',	C('B'),
  /* 49 - 'n'	*/	L('n'),	'N',	A('n'),	'n',	'N',	C('N'),
  /* 50 - 'm'	*/	L('m'),	'M',	A('m'),	'm',	'M',	C('M'),
  /* 51 - ','	*/	',',	';',	A(','),	',',	';',	C('@'),
  /* 52 - '.'	*/	'.',	':',	A('.'),	'.',	':',	C('@'),
  #if 0
  /* 53 - '/'	*/	'-',	'_',	A('-'), '-',	'_',	C('@'),     /* deberia ser com=
o la (43) */
  #else
  /* 43 - '\\'	*/	L(0207),0200,	A(0207),'}',	0200,	C('@'), =

  #endif
  /* 54 - r. SHIFT*/	SHIFT,	SHIFT,	SHIFT,	SHIFT,	SHIFT,	SHIFT,
  /* 55 - '*'	*/	'*',	'*',	A('*'),	'*',	'*',	C('M'),
  /* 56 - ALT	*/	ALT,	ALT,	ALT,	ALT,	ALT,	ALT,
  /* 57 - ' '	*/	' ',	' ',	A(' '),	' ',	' ',	C('@'),
  /* 58 - CapsLck	*/	CALOCK,	CALOCK,	CALOCK,	CALOCK,	CALOCK,	CALOCK,
  /* 59 - F1	*/	F1,	SF1,	AF1,	AF1,	ASF1,	CF1,
  /* 60 - F2	*/	F2,	SF2,	AF2,	AF2,	ASF2,	CF2,
  /* 61 - F3	*/	F3,	SF3,	AF3,	AF3,	ASF3,	CF3,
  /* 62 - F4	*/	F4,	SF4,	AF4,	AF4,	ASF4,	CF4,
  /* 63 - F5	*/	F5,	SF5,	AF5,	AF5,	ASF5,	CF5,
  /* 64 - F6	*/	F6,	SF6,	AF6,	AF6,	ASF6,	CF6,
  /* 65 - F7	*/	F7,	SF7,	AF7,	AF7,	ASF7,	CF7,
  /* 66 - F8	*/	F8,	SF8,	AF8,	AF8,	ASF8,	CF8,
  /* 67 - F9	*/	F9,	SF9,	AF9,	AF9,	ASF9,	CF9,
  /* 68 - F10	*/	F10,	SF10,	AF10,	AF10,	ASF10,	CF10,
  /* 69 - NumLock	*/	NLOCK,	NLOCK,	NLOCK,	NLOCK,	NLOCK,	NLOCK,
  /* 70 - ScrLock */	SLOCK,	SLOCK,	SLOCK,	SLOCK,	SLOCK,	SLOCK,
  /* 71 - Home	*/	HOME,	'7',	AHOME,	AHOME,	'7',	CHOME,	=

  /* 72 - CurUp	*/	UP,	'8',	AUP,	AUP,	'8',	CUP,
  /* 73 - PgUp	*/	PGUP,	'9',	APGUP,	APGUP,	'9',	CPGUP,
  /* 74 - '-'	*/	NMIN,	'-',	ANMIN,	ANMIN,	'-',	CNMIN,
  /* 75 - Left	*/	LEFT,	'4',	ALEFT,	ALEFT,	'4',	CLEFT,
  /* 76 - MID	*/	MID,	'5',	AMID,	AMID,	'5',	CMID,
  /* 77 - Right	*/	RIGHT,	'6',	ARIGHT,	ARIGHT,	'6',	CRIGHT,
  /* 78 - '+'	*/	PLUS,	'+',	APLUS,	APLUS,	'+',	CPLUS,
  /* 79 - End	*/	END,	'1',	AEND,	AEND,	'1',	CEND,
  /* 80 - Down	*/	DOWN,	'2',	ADOWN,	ADOWN,	'2',	CDOWN,
  /* 81 - PgDown	*/	PGDN,	'3',	APGDN,	APGDN,	'3',	CPGDN,
  /* 82 - Insert	*/	INSRT,	'0',	AINSRT,	AINSRT,	'0',	CINSRT,
  /* 83 - Delete	*/	0177,	'.',	A(0177),0177,	'.',	0177,
  /* 84 - Enter	*/	C('M'),	C('M'),	CA('M'),C('M'),	C('M'),	C('J'),
  /* 85 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 86 - ???	*/	'<',	'>',	A('<'),	'<',	'>',	C('@'),
  /* 87 - F11	*/	F11,	SF11,	AF11,	AF11,	ASF11,	CF11,
  /* 88 - F12	*/	F12,	SF12,	AF12,	AF12,	ASF12,	CF12,
  /* 89 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 90 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 91 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 92 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 93 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 94 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 95 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 96 - EXT_KEY	*/	EXTKEY,	EXTKEY,	EXTKEY,	EXTKEY,	EXTKEY,	EXTKEY,
  /* 97 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 98 - ???	*/	0,	0,	0,	0,	0,	0,
  /* 99 - ???	*/	0,	0,	0,	0,	0,	0,
  /*100 - ???	*/	0,	0,	0,	0,	0,	0,
  /*101 - ???	*/	0,	0,	0,	0,	0,	0,
  /*102 - ???	*/	0,	0,	0,	0,	0,	0,
  /*103 - ???	*/	0,	0,	0,	0,	0,	0,
  /*104 - ???	*/	0,	0,	0,	0,	0,	0,
  /*105 - ???	*/	0,	0,	0,	0,	0,	0,
  /*106 - ???	*/	0,	0,	0,	0,	0,	0,
  /*107 - ???	*/	0,	0,	0,	0,	0,	0,
  /*108 - ???	*/	0,	0,	0,	0,	0,	0,
  /*109 - ???	*/	0,	0,	0,	0,	0,	0,
  /*110 - ???	*/	0,	0,	0,	0,	0,	0,
  /*111 - ???	*/	0,	0,	0,	0,	0,	0,
  /*112 - ???	*/	0,	0,	0,	0,	0,	0,
  /*113 - ???	*/	0,	0,	0,	0,	0,	0,
  /*114 - ???	*/	0,	0,	0,	0,	0,	0,
  /*115 - ???	*/	0,	0,	0,	0,	0,	0,
  /*116 - ???	*/	0,	0,	0,	0,	0,	0,
  /*117 - ???	*/	0,	0,	0,	0,	0,	0,
  /*118 - ???	*/	0,	0,	0,	0,	0,	0,
  /*119 - ???	*/	0,	0,	0,	0,	0,	0,
  /*120 - ???	*/	0,	0,	0,	0,	0,	0,
  /*121 - ???	*/	0,	0,	0,	0,	0,	0,
  /*122 - ???	*/	0,	0,	0,	0,	0,	0,
  /*123 - ???	*/	0,	0,	0,	0,	0,	0,
  /*124 - ???	*/	0,	0,	0,	0,	0,	0,
  /*125 - ???	*/	0,	0,	0,	0,	0,	0,
  /*126 - ???	*/	0,	0,	0,	0,	0,	0,
  /*127 - ???	*/	0,	0,	0,	0,	0,	0
  };

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861946/+subscriptions

