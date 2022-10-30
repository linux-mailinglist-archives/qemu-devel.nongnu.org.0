Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BADE61277C
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 06:21:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op0l4-0007KD-6a; Sun, 30 Oct 2022 01:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1op0kx-0007Jw-Vk
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 01:21:12 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1op0ku-00010i-Mn
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 01:21:11 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 48DB0320051E;
 Sun, 30 Oct 2022 01:21:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 30 Oct 2022 01:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nunn.io; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667107263; x=
 1667193663; bh=0k3u8syOvwGWcwYonvb6Zz09yQ2Wt4/it8+vluBzL6k=; b=N
 hetCPSMmJWWBNLecZPOEt+Uee4N2Yyd4Gq2/oyGEPv+HLu1H4BY1ujgzomqFwgcl
 4i6vIMwc00l2kiMIxax2ivVv8fYEDV7F8+Kku0Yy5EIIGkgLetIYDSTt0kZ4l4yj
 hBx22PonJHX12Wq35lS62OBRpM2nz6Gx3HP58p7f4HHQS9zZqP+uFNCTI7TrsIzE
 G8qpWjgoYHE8qzOz142TjZ0s0Bnvg1z6qznkCmrg88GfviUeCP/3ZeTav/8oQw5i
 Pgdkx8+o01A7G4l2VrbAkYB1m+Lb0Hu7koNuTX/bsEQXDUQXI+1Nnf79wj3zN68f
 TKqLYzdxcfZNMjhy6ZFoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667107263; x=
 1667193663; bh=0k3u8syOvwGWcwYonvb6Zz09yQ2Wt4/it8+vluBzL6k=; b=l
 6eHymk8lOAULTMIBCbfcRFt8egVNldRzFrwkJZgmvUK0qJT3/mFcK8nhy0xc0PMn
 mbXHfgvY7O41uMFYE0ZAmGfIcoZtu8ZwFf3mBFHKbJrcsIMbe0eQezcaIgGu9hbN
 WwAbZsyQPdHYbj2IEOAUfYwK/OF4I6Nri2ReTbeVVFUYnZ55pND9ZZ+4jOrpL3IK
 T1t4h1zeLo5yNwbYkh711vBtIXccRZrS74Qxks23kRiJ4mzZmlb0NSBDmadYBi7a
 IL4RoOeBJ76U3I8O+IL30BjWff0Lr9NPeZ5g5mNPEI28mSoH8qkUPP/2jtnfJebe
 aDFosLL0Tf4yowUxdU3IA==
X-ME-Sender: <xms:vwleYx3KGmc6B1PUvAhZKxwSxkkp-I1__73XCNliNIHjcQX107lLqQ>
 <xme:vwleY4E4sLi-nQfzn3HWC5qHjTTOSj24YwHXskTEmg7XjxVvHspPVnPfiWp1789xe
 1NRFPc9MtoSg2C-AQ>
X-ME-Received: <xmr:vwleYx5NGOIh2kBnA4NeHI50T0vWGsg-OHb4UIEvbca27hE7dFTflI1NbAACPuzGIzpad_LRxxiKdapULx5WHgO3Nn6JYnvmPzy1gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdelgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtvdenucfhrhhomhepgfhllhhi
 ohhtucfpuhhnnhcuoegvlhhlihhothesnhhunhhnrdhioheqnecuggftrfgrthhtvghrnh
 epgfffvddvudevteejudekgfeigfeiffejtedtheetfeevhfffiedvteeuffdtfeehnecu
 ffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepvghllhhiohhtsehnuhhn
 nhdrihho
X-ME-Proxy: <xmx:vwleY-01LXrbv4z8wC_XdnvKOUtATYtYA9XHsTdjecKD3bFOWjVMFQ>
 <xmx:vwleY0GochwzL3mXIRwycS3GCxgjsaFM-iKyUdHTR9iWxHmcAOIa0Q>
 <xmx:vwleY_-lzhpVOsdkEVn6ESKz1NArZXchI0qd72Iu2OHO7htOeIKlsg>
 <xmx:vwleY5QceE4s8OOtoSYwWbbPE8LfehUNvFxPOk5w8sU_K568iTZC8Q>
Feedback-ID: i6a78429f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Oct 2022 01:21:01 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] ui/cocoa: Support hardware cursor interface
From: Elliot Nunn <elliot@nunn.io>
In-Reply-To: <CAMVc7JXPi3kbFyrN9757uKt-cUprKUBLM9nuDMRjawtVePVVAw@mail.gmail.com>
Date: Sun, 30 Oct 2022 13:20:57 +0800
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5232C333-9F52-455D-A0D5-B1A438800717@nunn.io>
References: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
 <CAFEAcA_bip7nifW-Zq8qrSmZTCUQA1VMpMR8HSHsKVBAeQxy0A@mail.gmail.com>
 <CAMVc7JXPi3kbFyrN9757uKt-cUprKUBLM9nuDMRjawtVePVVAw@mail.gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Received-SPF: pass client-ip=64.147.123.25; envelope-from=elliot@nunn.io;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Akihiko,

Thanks very much for reviewing my patch.

I think that you were right to use the sprite-within-a-window approach,
and avoid warping the OS cursor. I tried to compensate for the error
that cursor warping causes in the subsequent mouse event, but there is
still some error getting through that makes the cursor feel "janky".

But in absolute pointing mode, will it be possible to remove the guest's
code path from visual updates of the cursor? I find that under Mac OS 9,
this provides better responsiveness. I can think of two methods:

1. In absolute pointing mode, re-enable Cocoa's cursor and let the host
OS move it according to user input.

2. Keep the cursor sprite, but move it according to Cocoa's mouse
movement events instead of dpy_mouse_set events.

I prefer option 2. What do you think?

And I didn't realise that you had added VirGL support to cocoa.m. Well
done! Is it on track for release?

My patch should be withdrawn from consideration, in favour of a future
solution that does not use cursor warping.

Many thanks,

Elliot

> On 6 Oct 2022, at 8:15 pm, Akihiko Odaki <akihiko.odaki@gmail.com> =
wrote:
>=20
> Thanks Peter and Elliot,
>=20
> Unfortunately Patchew seems to have failed to apply the patch to the
> current master. It would be nice if you rebase it to the current
> master.
>=20
> Actually I have a patch to add hardware support to ui/cocoa, but I
> have not submitted to the mailing list because it depends on a number
> of other patches:
> =
https://github.com/akihikodaki/qemu/commit/34199fcd4080ce8c705b46df26fdf02=
966b1610c
>=20
> My patch avoided using CGWarpMouseCursorPosition because of its
> quirks. I'd like to test your patch by myself to see if it avoids them
> properly for my own workloads.
>=20
> I have also added some comments to the patch. Please see the below.
>=20
> Regards,
> Akihiko Odaki
>=20
> On Wed, Oct 5, 2022 at 12:39 AM Peter Maydell =
<peter.maydell@linaro.org> wrote:
>>=20
>> Ccing Akihiko to see if he wants to review this cocoa ui frontend
>> patch.
>>=20
>> also available at:
>> =
https://lore.kernel.org/qemu-devel/54930451-d85f-4ce0-9a45-b3478c5a6468@ww=
w.fastmail.com/
>>=20
>> I can confirm that the patch does build, but I don't have any
>> interesting graphics-using test images to hand to test with.
>>=20
>> thanks
>> -- PMM
>>=20
>> On Thu, 4 Aug 2022 at 07:28, Elliot Nunn <elliot@nunn.io> wrote:
>>>=20
>>> Implement dpy_cursor_define() and dpy_mouse_set() on macOS.
>>>=20
>>> The main benefit is from dpy_cursor_define: in absolute pointing =
mode, the
>>> host can redraw the cursor on the guest's behalf much faster than =
the guest
>>> can itself.
>>>=20
>>> To provide the programmatic movement expected from a hardware =
cursor,
>>> dpy_mouse_set is also implemented.
>>>=20
>>> Tricky cases are handled:
>>> - dpy_mouse_set() avoids rounded window corners.
>>> - The sometimes-delay between warping the cursor and an affected =
mouse-move
>>>  event is accounted for.
>>> - Cursor bitmaps are nearest-neighbor scaled to Retina size.
>>>=20
>>> Signed-off-by: Elliot Nunn <elliot@nunn.io>
>>> ---
>>> ui/cocoa.m | 263 =
++++++++++++++++++++++++++++++++++++++++++++++++-----
>>> 1 file changed, 240 insertions(+), 23 deletions(-)
>>>=20
>>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>>> index 5a8bd5dd84..f9d54448e4 100644
>>> --- a/ui/cocoa.m
>>> +++ b/ui/cocoa.m
>>> @@ -85,12 +85,20 @@ static void cocoa_switch(DisplayChangeListener =
*dcl,
>>>=20
>>> static void cocoa_refresh(DisplayChangeListener *dcl);
>>>=20
>>> +static void cocoa_mouse_set(DisplayChangeListener *dcl,
>>> +                            int x, int y, int on);
>>> +
>>> +static void cocoa_cursor_define(DisplayChangeListener *dcl,
>>> +                                QEMUCursor *c);
>>> +
>>> static NSWindow *normalWindow;
>>> static const DisplayChangeListenerOps dcl_ops =3D {
>>>     .dpy_name          =3D "cocoa",
>>>     .dpy_gfx_update =3D cocoa_update,
>>>     .dpy_gfx_switch =3D cocoa_switch,
>>>     .dpy_refresh =3D cocoa_refresh,
>>> +    .dpy_mouse_set =3D cocoa_mouse_set,
>>> +    .dpy_cursor_define =3D cocoa_cursor_define,
>>> };
>>> static DisplayChangeListener dcl =3D {
>>>     .ops =3D &dcl_ops,
>>> @@ -313,6 +321,13 @@ @interface QemuCocoaView : NSView
>>>     BOOL isFullscreen;
>>>     BOOL isAbsoluteEnabled;
>>>     CFMachPortRef eventsTap;
>>> +    NSCursor *guestCursor;
>>> +    BOOL cursorHiddenByMe;
>=20
> Who is "Me" here?
>=20
>>> +    BOOL guestCursorVis;
>>> +    int guestCursorX, guestCursorY;
>>> +    int lastWarpX, lastWarpY;
>>> +    int warpDeltaX, warpDeltaY;
>>> +    BOOL ignoreNextMouseMove;
>>> }
>>> - (void) switchSurface:(pixman_image_t *)image;
>>> - (void) grabMouse;
>>> @@ -323,6 +338,10 @@ - (void) handleMonitorInput:(NSEvent *)event;
>>> - (bool) handleEvent:(NSEvent *)event;
>>> - (bool) handleEventLocked:(NSEvent *)event;
>>> - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
>>> +- (void) cursorDefine:(NSCursor *)cursor;
>>> +- (void) mouseSetX:(int)x Y:(int)y on:(int)on;
>>> +- (void) setCursorAppearance;
>>> +- (void) setCursorPosition;
>>> /* The state surrounding mouse grabbing is potentially confusing.
>>>  * isAbsoluteEnabled tracks qemu_input_is_absolute() [ie "is the =
emulated
>>>  *   pointing device an absolute-position one?"], but is only =
updated on
>>> @@ -432,22 +451,6 @@ - (CGPoint) screenLocationOfEvent:(NSEvent *)ev
>>>     }
>>> }
>>>=20
>>> -- (void) hideCursor
>>> -{
>>> -    if (!cursor_hide) {
>>> -        return;
>>> -    }
>>> -    [NSCursor hide];
>>> -}
>>> -
>>> -- (void) unhideCursor
>>> -{
>>> -    if (!cursor_hide) {
>>> -        return;
>>> -    }
>>> -    [NSCursor unhide];
>>> -}
>>> -
>>> - (void) drawRect:(NSRect) rect
>>> {
>>>     COCOA_DEBUG("QemuCocoaView: drawRect\n");
>>> @@ -635,6 +638,8 @@ - (void) switchSurface:(pixman_image_t *)image
>>>         screen.height =3D h;
>>>         [self setContentDimensions];
>>>         [self setFrame:NSMakeRect(cx, cy, cw, ch)];
>>> +        [self setCursorAppearance];
>=20
> Why do you need to set cursor appearance when resizing the screen?
>=20
>>> +        [self setCursorPosition];
>>>     }
>>>=20
>>>     // update screenBuffer
>>> @@ -681,6 +686,7 @@ - (void) toggleFullScreen:(id)sender
>>>             styleMask:NSWindowStyleMaskBorderless
>>>             backing:NSBackingStoreBuffered
>>>             defer:NO];
>>> +        [fullScreenWindow disableCursorRects];
>>>         [fullScreenWindow setAcceptsMouseMovedEvents: YES];
>>>         [fullScreenWindow setHasShadow:NO];
>>>         [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
>>> @@ -812,6 +818,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>     int buttons =3D 0;
>>>     int keycode =3D 0;
>>>     bool mouse_event =3D false;
>>> +    bool mousemoved_event =3D false;
>>>     // Location of event in virtual screen coordinates
>>>     NSPoint p =3D [self screenLocationOfEvent:event];
>>>     NSUInteger modifiers =3D [event modifierFlags];
>>> @@ -1023,6 +1030,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>                 }
>>>             }
>>>             mouse_event =3D true;
>>> +            mousemoved_event =3D true;
>>>             break;
>>>         case NSEventTypeLeftMouseDown:
>>>             buttons |=3D MOUSE_EVENT_LBUTTON;
>>> @@ -1039,14 +1047,17 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>         case NSEventTypeLeftMouseDragged:
>>>             buttons |=3D MOUSE_EVENT_LBUTTON;
>>>             mouse_event =3D true;
>>> +            mousemoved_event =3D true;
>>>             break;
>>>         case NSEventTypeRightMouseDragged:
>>>             buttons |=3D MOUSE_EVENT_RBUTTON;
>>>             mouse_event =3D true;
>>> +            mousemoved_event =3D true;
>>>             break;
>>>         case NSEventTypeOtherMouseDragged:
>>>             buttons |=3D MOUSE_EVENT_MBUTTON;
>>>             mouse_event =3D true;
>>> +            mousemoved_event =3D true;
>>>             break;
>>>         case NSEventTypeLeftMouseUp:
>>>             mouse_event =3D true;
>>> @@ -1121,7 +1132,12 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>             qemu_input_update_buttons(dcl.con, bmap, last_buttons, =
buttons);
>>>             last_buttons =3D buttons;
>>>         }
>>> -        if (isMouseGrabbed) {
>>> +
>>> +        if (!isMouseGrabbed) {
>>> +            return false;
>>> +        }
>>> +
>>> +        if (mousemoved_event) {
>>>             if (isAbsoluteEnabled) {
>>>                 /* Note that the origin for Cocoa mouse coords is =
bottom left, not top left.
>>>                  * The check on screenContainsPoint is to avoid =
sending out of range values for
>>> @@ -1132,11 +1148,38 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>                     qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, =
screen.height - p.y, 0, screen.height);
>>>                 }
>>>             } else {
>>> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, =
(int)[event deltaX]);
>>> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, =
(int)[event deltaY]);
>>> +                if (ignoreNextMouseMove) {
>>> +                    // Discard the first mouse-move event after a =
grab, because
>>> +                    // it includes the warp delta from an unknown =
initial position.
>>> +                    ignoreNextMouseMove =3D NO;
>>> +                    warpDeltaX =3D warpDeltaY =3D 0;
>>> +                } else {
>>> +                    // Correct subsequent events to remove the =
known warp delta.
>>> +                    // The warp delta is sometimes late to be =
reported, so never
>>> +                    // allow the delta compensation to alter the =
direction.
>>> +                    int dX =3D (int)[event deltaX];
>>> +                    int dY =3D (int)[event deltaY];
>>> +
>>> +                    if (dX =3D=3D 0 || (dX ^ (dX - warpDeltaX)) < =
0) { // Flipped sign?
>=20
> Instead, do: (dx < 0) =3D=3D (dx - warpDeltaX < 0). The original =
flipped
> sign check is dependent on an implementation-defined behavior, and a
> bit difficult to understand. A decent compiler should be able to
> optimize it to the bitwise operation.
>=20
>>> +                        warpDeltaX -=3D dX; // Save excess =
correction for later
>>> +                        dX =3D 0;
>>> +                    } else {
>>> +                        dX -=3D warpDeltaX; // Apply entire =
correction
>>> +                        warpDeltaX =3D 0;
>>> +                    }
>>> +
>>> +                    if (dY =3D=3D 0 || (dY ^ (dY - warpDeltaY)) < =
0) {
>>> +                        warpDeltaY -=3D dY;
>>> +                        dY =3D 0;
>>> +                    } else {
>>> +                        dY -=3D warpDeltaY;
>>> +                        warpDeltaY =3D 0;
>>> +                    }
>>> +
>>> +                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, =
dX);
>>> +                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, =
dY);
>>> +                }
>>>             }
>>> -        } else {
>>> -            return false;
>>>         }
>>>         qemu_input_event_sync();
>>>     }
>>> @@ -1153,9 +1196,15 @@ - (void) grabMouse
>>>         else
>>>             [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to =
release Mouse)"];
>>>     }
>>> -    [self hideCursor];
>>>     CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>>>     isMouseGrabbed =3D TRUE; // while isMouseGrabbed =3D TRUE, =
QemuCocoaApp sends all events to [cocoaView handleEvent:]
>>> +    [self setCursorAppearance];
>>> +    [self setCursorPosition];
>>> +
>>> +    // We took over and warped the mouse, so ignore the next =
mouse-move
>>> +    if (!isAbsoluteEnabled) {
>>> +        ignoreNextMouseMove =3D YES;
>>> +    }
>=20
> It shouldn't warp the mouse when the pointing device is absolute. An
> absolute pointing device, especially vdagent, is often used to
> seamlessly integrate the guest and host cursors.
>=20
>>> }
>>>=20
>>> - (void) ungrabMouse
>>> @@ -1168,9 +1217,14 @@ - (void) ungrabMouse
>>>         else
>>>             [normalWindow setTitle:@"QEMU"];
>>>     }
>>> -    [self unhideCursor];
>>>     CGAssociateMouseAndMouseCursorPosition(TRUE);
>>>     isMouseGrabbed =3D FALSE;
>>> +    [self setCursorAppearance];
>>> +
>>> +    if (!isAbsoluteEnabled) {
>>> +        ignoreNextMouseMove =3D NO;
>>> +        warpDeltaX =3D warpDeltaY =3D 0;
>>> +    }
>>> }
>>>=20
>>> - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
>>> @@ -1179,6 +1233,116 @@ - (void) =
setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
>>>         CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>>>     }
>>> }
>>> +
>>> +// Indirectly called by dpy_cursor_define() in the virtual GPU
>>> +- (void) cursorDefine:(NSCursor *)cursor {
>>> +    guestCursor =3D cursor;
>=20
> The old cursor is leaked here. Note that ARC is not enabled on QEMU,
> unfortunately.
>=20
>>> +    [self setCursorAppearance];
>>> +}
>>> +
>>> +// Indirectly called by dpy_mouse_set() in the virtual GPU
>>> +- (void) mouseSetX:(int)x Y:(int)y on:(int)on {
>>> +    if (!on !=3D !guestCursorVis) {
>>> +        guestCursorVis =3D on;
>>> +        [self setCursorAppearance];
>>> +    }
>>> +
>>> +    if (on && (x !=3D guestCursorX || y !=3D guestCursorY)) {
>>> +        guestCursorX =3D x;
>>> +        guestCursorY =3D y;
>>> +        [self setCursorPosition];
>>> +    }
>>> +}
>>> +
>>> +// Change the cursor image to the default, the guest cursor bitmap =
or hidden.
>>> +// Said to be an expensive operation on macOS Monterey, so use =
sparingly.
>>> +- (void) setCursorAppearance {
>>> +    NSCursor *cursor =3D NULL; // NULL means hidden
>>> +
>>> +    if (!isMouseGrabbed) {
>>> +        cursor =3D [NSCursor arrowCursor];
>>> +    } else if (!guestCursor && !cursor_hide) {
>>> +        cursor =3D [NSCursor arrowCursor];
>>> +    } else if (guestCursorVis && guestCursor) {
>>> +        cursor =3D guestCursor;
>>> +    } else {
>>> +        cursor =3D NULL;
>>> +    }
>>> +
>>> +    if (cursor !=3D NULL) {
>>> +        [cursor set];
>>> +
>>> +        if (cursorHiddenByMe) {
>>> +            [NSCursor unhide];
>>> +            cursorHiddenByMe =3D NO;
>>> +        }
>>> +    } else {
>>> +        if (!cursorHiddenByMe) {
>>> +            [NSCursor hide];
>>> +            cursorHiddenByMe =3D YES;
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +// Move the cursor within the virtual screen
>>> +- (void) setCursorPosition {
>>> +    // Ignore the guest's request if the cursor belongs to Cocoa
>>> +    if (!isMouseGrabbed || isAbsoluteEnabled) {
>>> +        return;
>>> +    }
>>> +
>>> +    // Get guest screen rect in Cocoa coordinates (bottom-left =
origin).
>>> +    NSRect virtualScreen =3D [[self window] =
convertRectToScreen:[self frame]];
>>> +
>>> +    // Convert to top-left origin.
>>> +    NSInteger hostScreenH =3D [NSScreen =
screens][0].frame.size.height;
>>> +    int scrX =3D virtualScreen.origin.x;
>>> +    int scrY =3D hostScreenH - virtualScreen.origin.y - =
virtualScreen.size.height;
>>> +    int scrW =3D virtualScreen.size.width;
>>> +    int scrH =3D virtualScreen.size.height;
>>> +
>>> +    int cursX =3D scrX + guestCursorX;
>>> +    int cursY =3D scrY + guestCursorY;
>>> +
>>> +    // Clip to edges
>>> +    cursX =3D MIN(MAX(scrX, cursX), scrX + scrW - 1);
>>> +    cursY =3D MIN(MAX(scrY, cursY), scrY + scrH - 1);
>>> +
>>> +    // Move diagonally towards the center to avoid rounded window =
corners.
>>> +    // Limit the number of hit-tests and discard failed attempts.
>>> +    int betterX =3D cursX, betterY =3D cursY;
>>> +    for (int i=3D0; i<16; i++) {
>>> +        if ([NSWindow windowNumberAtPoint:NSMakePoint(betterX, =
hostScreenH - betterY)
>>> +            belowWindowWithWindowNumber:0] =3D=3D =
self.window.windowNumber) {
>>> +            cursX =3D betterX;
>>> +            cursY =3D betterY;
>>> +            break;
>>> +        };
>>> +
>>> +        if (betterX < scrX + scrW/2) {
>>> +            betterX++;
>>> +        } else {
>>> +            betterX--;
>>> +        }
>>> +
>>> +        if (betterY < scrY + scrH/2) {
>>> +            betterY++;
>>> +        } else {
>>> +            betterY--;
>>> +        }
>>> +    }
>>> +
>>> +    // Subtract this warp delta from the next =
NSEventTypeMouseMoved.
>>> +    // These are in down-is-positive coords, same as NSEvent =
deltaX/deltaY.
>>> +    warpDeltaX +=3D cursX - lastWarpX;
>>> +    warpDeltaY +=3D cursY - lastWarpY;
>>> +
>>> +    CGWarpMouseCursorPosition(NSMakePoint(cursX, cursY));
>>> +
>>> +    lastWarpX =3D cursX;
>>> +    lastWarpY =3D cursY;
>>> +}
>>> +
>>> - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
>>> - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
>>> - (float) cdx {return cdx;}
>>> @@ -1251,6 +1415,7 @@ - (id) init
>>>             error_report("(cocoa) can't create window");
>>>             exit(1);
>>>         }
>>> +        [normalWindow disableCursorRects];
>>>         [normalWindow setAcceptsMouseMovedEvents:YES];
>>>         [normalWindow setTitle:@"QEMU"];
>>>         [normalWindow setContentView:cocoaView];
>>> @@ -2123,6 +2288,58 @@ static void cocoa_display_init(DisplayState =
*ds, DisplayOptions *opts)
>>>     qemu_clipboard_peer_register(&cbpeer);
>>> }
>>>=20
>>> +static void cocoa_mouse_set(DisplayChangeListener *dcl, int x, int =
y, int on) {
>=20
> Put { for a function in a new line. See docs/devel/style.rst.
>=20
>>> +    dispatch_async(dispatch_get_main_queue(), ^{
>>> +        [cocoaView mouseSetX:x Y:y on:on];
>>> +    });
>>> +}
>>> +
>>> +// Convert QEMUCursor to NSCursor, then call cursorDefine
>>> +static void cocoa_cursor_define(DisplayChangeListener *dcl, =
QEMUCursor *cursor) {
>>> +    CFDataRef cfdata =3D CFDataCreate(
>>> +        /*allocator*/ NULL,
>>> +        /*bytes*/ (void *)cursor->data,
>>> +        /*length*/ sizeof(uint32_t) * cursor->width * =
cursor->height);
>>> +
>>> +    CGDataProviderRef dataprovider =3D =
CGDataProviderCreateWithCFData(cfdata);
>>> +
>>> +    CGImageRef cgimage =3D CGImageCreate(
>>> +        cursor->width, cursor->height,
>>> +        /*bitsPerComponent*/ 8,
>>> +        /*bitsPerPixel*/ 32,
>>> +        /*bytesPerRow*/ sizeof(uint32_t) * cursor->width,
>>> +        /*colorspace*/ =
CGColorSpaceCreateWithName(kCGColorSpaceSRGB),
>>> +        /*bitmapInfo*/ kCGBitmapByteOrder32Host | =
kCGImageAlphaLast,
>>> +        /*provider*/ dataprovider,
>>> +        /*decode*/ NULL,
>>> +        /*shouldInterpolate*/ FALSE,
>>> +        /*intent*/ kCGRenderingIntentDefault);
>>> +
>>> +    NSImage *unscaled =3D [[NSImage alloc] initWithCGImage:cgimage =
size:NSZeroSize];
>>> +
>>> +    CFRelease(cfdata);
>>> +    CGDataProviderRelease(dataprovider);
>>> +    CGImageRelease(cgimage);
>>> +
>>> +    // Nearest-neighbor scale to the possibly "Retina" cursor size
>>> +    NSImage *scaled =3D [NSImage
>>> +        imageWithSize:NSMakeSize(cursor->width, cursor->height)
>>> +        flipped:NO
>>> +        drawingHandler:^BOOL(NSRect dest) {
>>> +            [NSGraphicsContext currentContext].imageInterpolation =3D=
 NSImageInterpolationNone;
>>> +            [unscaled drawInRect:dest];
>>> +            return YES;
>>> +        }];
>=20
> unscaled and scaled are leaked.
>=20
>>> +
>>> +    NSCursor *nscursor =3D [[NSCursor alloc]
>>> +        initWithImage:scaled
>>> +        hotSpot:NSMakePoint(cursor->hot_x, cursor->hot_y)];
>>> +
>>> +    dispatch_async(dispatch_get_main_queue(), ^{
>>> +        [cocoaView cursorDefine:nscursor];
>>> +    });
>>> +}
>>> +
>>> static QemuDisplay qemu_display_cocoa =3D {
>>>     .type       =3D DISPLAY_TYPE_COCOA,
>>>     .init       =3D cocoa_display_init,


